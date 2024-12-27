//
//  CoinType.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//


import Foundation

enum CoinType: String, Identifiable, CaseIterable {
    
    case BTC
    case ETH
    case DOGE
    case BNB
    case USUAL
    case PEPE
    case SOL
    case ZEN
    case XRP
    case PNUT
    case PENGU
    case SUI
    
    var id: Self { self }

}
