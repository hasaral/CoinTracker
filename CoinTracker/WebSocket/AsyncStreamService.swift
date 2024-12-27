//
//  AsyncStreamService.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//


import Foundation
import Network
import SwiftUI

class AsyncStreamService: NSObject {
    
    private let session = URLSession(configuration: .default)
    private var wsTask: URLSessionWebSocketTask?
    private var pingTryCount = 0

    private let coinDictionaryCurrentValueStream = CurrentValueAsyncStream(initialValue: [String: CoinDictModel]())
    var coinDictionaryStream: AsyncStream<[String: CoinDictModel]> { coinDictionaryCurrentValueStream.stream }
    
    private(set) lazy var connectionStateStream: AsyncStream<Bool> = {
        AsyncStream<Bool> { continuation in
            self.connectionStateStreamContinuation = continuation
        }
    }()
    private var connectionStateStreamContinuation: AsyncStream<Bool>.Continuation?
    
    private let monitor = NWPathMonitor()
    
    func connect() {
        let apisKey = "e42328e0a07699872238807ddaf56b7c3918d4e795f78ff3c6b215759f9bcd42"
        //let apisKey = "b8ed03f526318f7a499391ebc000b2c8a1a8b3d72fbbb01fbc2cfbfd1d16d2c4"
        //let apisKey = "7aadea7e405cda856374a2c28d8b71025c5fe87994c921f48f908a5f401d96cf"
        let url = URL(string: "wss://streamer.cryptocompare.com/v2?api_key=\(apisKey)")!
 
        wsTask = session.webSocketTask(with: url)
        //SubRemove
        let subMessage = [
                    "action": "SubAdd",
                    "subs": ["2~Binance~ETH~USDT", "2~Binance~BTC~USDT", "2~Binance~DOGE~USDT", "2~Binance~BNB~USDT", "2~Binance~USUAL~USDT", "2~Binance~PEPE~USDT", "2~Binance~SOL~USDT", "2~Binance~ZEN~USDT", "2~Binance~XRP~USDT","2~Binance~PENGU~USDT","2~Binance~SUI~USDT","2~Binance~PNUT~USDT"]
        ] as [String : Any]

        let subMessageOne = [
                    "action": "SubAdd",
                    "subs": ["0~Binance~BTC~USDT"]
        ] as [String : Any]

        
        let jsonData = try! JSONSerialization.data(withJSONObject: subMessage)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
        
        wsTask?.delegate = self
        
     
        wsTask?.send(URLSessionWebSocketTask.Message.string(jsonString as! String)) { [weak self] error in
            if let error = error {
                print("Failed with Error \(error.localizedDescription)")
            } else {
                // no-op
            }
        }
        wsTask?.resume()
        self.receiveMessage()
        self.schedulePing()
    }
    
    func startMonitorNetworkConnectivity() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            if path.status == .satisfied, self.wsTask == nil {
                self.connect()
                return
            }
            
            if path.status != .satisfied {
                self.clearConnection()
            }
        }
        monitor.start(queue: .main)
    }
    
    private func receiveMessage() {
        wsTask?.receive { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let message):

                switch message {
                case .string(let text):
                    print("Received text message: \(text)")
                    if let data = text.data(using: .utf8) {
                        self.onReceiveData(data)
                    }
                case .data(let data):
                    print("Received binary message: \(data)")
                    self.onReceiveData(data)
                default: break
                }
                self.receiveMessage()
                
            case .failure(let error):
                 print("Failed to receive message: \(error.localizedDescription)")
            }
        }
    }
    
    private func onReceiveData(_ data: Data) {

        var newDictionary = [String: CoinDictModel]()

        do {
            
            let wrapper = try JSONDecoder().decode(CoinDictModel.self, from: data)
            newDictionary = ["set": wrapper]
 
            newDictionary.forEach { (key, value) in
                let value = value
                print(value)
                if value.type == "2" && (value.price != nil) {
                    newDictionary[value.fromsymbol ?? ""] = CoinDictModel(type: value.type, market: value.market, fromsymbol: value.fromsymbol, tosymbol: value.tosymbol, flags: value.flags, lasttradeid: value.lasttradeid, price: value.price, lastupdate: value.lastupdate, lastvolume: value.lastvolume, lastvolumeto: value.lastvolumeto, volumehour: value.volumehour, volumehourto: value.volumehourto, volumeday: value.volumeday, volumedayto: value.volumedayto, volume24Hour: value.volume24Hour, volume24Hourto: value.volume24Hourto)
                        
                        let mergedDictionary = coinDictionaryCurrentValueStream.getCurrentValue().merging(newDictionary) { $1 }
                        coinDictionaryCurrentValueStream.updateValue(mergedDictionary)
                }
            }
        } catch {
 
            print("Decoding error \(error.localizedDescription)")
        }
    }
 
    private func schedulePing() {
        let identifier = self.wsTask?.taskIdentifier ?? -1
        DispatchQueue.main.asyncAfter(deadline: .now() + 45) { [weak self] in
            guard let self = self, let task = self.wsTask,
                  task.taskIdentifier == identifier
            else {
                return
            }
            
            if task.state == .running, self.pingTryCount < 2 {
                self.pingTryCount += 1
                print("Ping: Send Ping \(self.pingTryCount)")
                task.sendPing { [weak self] error in
                    if let error = error {
                        print("Ping failed: \(error.localizedDescription)")
                    } else if self?.wsTask?.taskIdentifier == identifier {
                        self?.pingTryCount = 0
                    }
                }
                self.schedulePing()
            } else {
                self.reconnect()
            }
        }
    }
    
    private func reconnect() {
        self.clearConnection()
        self.connect()
    }
    
    func clearConnection() {
        self.wsTask?.cancel()
        self.wsTask = nil
        self.pingTryCount = 0
        self.connectionStateStreamContinuation?.yield(false)
     }
    
    deinit {
        self.coinDictionaryCurrentValueStream.finish()
        self.connectionStateStreamContinuation?.finish()
    }
}

extension AsyncStreamService: URLSessionWebSocketDelegate {
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        self.connectionStateStreamContinuation?.yield(true)
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        self.connectionStateStreamContinuation?.yield(false)
    }
    
}

