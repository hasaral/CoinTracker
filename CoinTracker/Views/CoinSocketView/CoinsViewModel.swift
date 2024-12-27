//
//  CoinsViewModel.swift
//  CoinTracker
//
//  Created by Hasan Saral on 24.12.2024.
//


import Foundation
import SwiftUI
import CommonModel

//final class CoinsViewModel: ObservableObject {
@Observable class CoinsViewModel {

    var webRepository = RealCoinWebRepository(session: configuredURLSession())
    var coinList: CoinListModel?
    var coinElement: CoinCommonModel?
    
    init() {
        
    }

    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
    
    func fetchData() {
        Task {
            coinElement = try? await webRepository.getCoinss(limit: "10", page: "0")
            print(coinElement)
        }
    }
    
    func fetchDataCoinList() {
        Task {
            coinList = try? await webRepository.getCoinsList()
            print(coinList)
        }
    }
    
//    func refreshCountriesList() async throws {
//        let apiCountries = try await webRepository.getCoinss(limit: "10", page: "0")
//    }
}
