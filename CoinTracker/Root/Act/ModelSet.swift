//
//  Model.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//


import SwiftUI
import Combine

class ModelSet: ObservableObject {
    // Tab Bar
    @Published var showTab: Bool = true
    
    // Navigation Bar
    @Published var showNav: Bool = true
    
    // Modal
    @Published var selectedModal: Modal = .signUp
    @Published var showModal: Bool = false
    @Published var dismissModal: Bool = false
    
    // Detail View
    @Published var showDetail: Bool = false
    @Published var selectedCoin: String = ""
    @Published var selectedCoinIndex: Int = 0

}

enum Modal: String {
    case signUp
    case signIn
}


extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
    static let flipCard = Animation.spring(response: 0.35, dampingFraction: 0.7)
    static let tabSelection = Animation.spring(response: 0.3, dampingFraction: 0.7)
}
