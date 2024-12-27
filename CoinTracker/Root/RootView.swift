//
//  RootView.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//


import SwiftUI
import CommonModel

struct RootView: View {
 
    init() {
        let thumbImage = UIImage(systemName: "circle.fill")
        UISlider.appearance()
            .setThumbImage(thumbImage, for: .normal)
    }
    
    @State var selectedTab = Tab.one
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CoinListView()
                .tabItem {
                    Label("", systemImage: "globe.europe.africa")
                }
                .tag(Tab.one)
            
            CoinsView()
                .tabItem {
                    Label("", systemImage: "mappin.circle.fill")
                }
                .tag(Tab.two)
            
        } // TabView
        .accentColor(.red)
        .background(Color.white)
    }
}


public enum Tab: Hashable {
    case one
    case two
}
