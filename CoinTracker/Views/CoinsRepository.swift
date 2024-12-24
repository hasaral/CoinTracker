//
//  CoinsRepository.swift
//  CoinTracker
//
//  Created by Hasan Saral on 24.12.2024.
//

import Foundation
import SwiftUI
import WebServe
import CommonModel
import Network

protocol CoinWebRepository: WebServe {
    func getCoinss(limit: String, page: String) async throws -> CoinCommonModel
    func getCoinsList() async throws -> CoinListModel

}

struct RealCoinWebRepository: CoinWebRepository {

    let session: URLSession
    let baseURL: String
//https://min-api.cryptocompare.com/data/top/totalvolfull?limit=1&page=0&tsym=USD
    init(session: URLSession) {
        self.session = session
        self.baseURL = "https://min-api.cryptocompare.com/data/"
    }

    func getCoinss(limit: String, page: String) async throws -> CommonModel.CoinCommonModel {
        return try await call(endpoint: API.allCoins(limit: limit, page: page))
    }
    
    func getCoinsList() async throws -> CommonModel.CoinListModel {
        return try await call(endpoint: API.coinList)
    }
}

// MARK: - Endpoints
//https://min-api.cryptocompare.com/data/
extension RealCoinWebRepository {
    enum API {
        case allCoins(limit: String, page: String)
        case coinList
    }
}

extension RealCoinWebRepository.API: APICall {
    var path: String {
        switch self {
        case .allCoins(let limit,let page):
            return "top/totalvolfull?limit=\(limit)&page=\(page)&tsym=USD"
        case .coinList:
            return "blockchain/list?api_key=e42328e0a07699872238807ddaf56b7c3918d4e795f78ff3c6b215759f9bcd42"
        }
    }
    var method: String {
        switch self {
        case .allCoins, .coinList:
            return "GET"
        }
    }
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    func body() throws -> Data? {
        return nil
    }
}

 
