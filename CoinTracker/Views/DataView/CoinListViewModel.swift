//
//  CoinListViewModel.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//


import Foundation
import SwiftUI

@MainActor
@Observable class CoinListViewModel {
    
    let coinTypes: CoinDictModel
    let coinSets: [CoinType]
    private(set) var coinDictionary = [String: CoinDictModel]()
    private(set) var statusT: Bool = false
 
    private let service: AsyncStreamService

    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 9
        formatter.currencyCode = "USD"
        return formatter
    }()
    
    init(coinSets: [CoinType] = CoinType.allCases,coinTypes: CoinDictModel, service: AsyncStreamService = .init()) {
        self.coinSets = coinSets
        self.coinTypes = coinTypes
        self.service = service
        self.service.connect()
        self.service.startMonitorNetworkConnectivity()
    }
    
    func listenToStream() {
        Task {
            let coinDictStream = service.coinDictionaryStream
            let connectionStateStream = service.connectionStateStream
            for await (coinDict, isConnected) in coinDictStream.combineLatest(with: connectionStateStream) {
                self.updateView(coinDict: coinDict, isConnected: isConnected)
            }
        }
    }
    
    func updateView(coinDict: [String: CoinDictModel], isConnected: Bool) {
        self.coinDictionary = coinDict
        if isConnected {
            self.statusT = true
        } else {
            self.statusT = false
        }
    }
    
    func valueText(for coinType: CoinType, type: String) -> String {
        if let coin = self.coinDictionary[coinType.rawValue],
           let value = self.currencyFormatter.string(from: NSNumber(value:coin.price ?? 0.0)) {

            return String(describing: value)
        } else {
            return "-"
        }
    }
}
