//
//  ContentView.swift
//  CoinTracker
//
//  Created by Hasan Saral on 23.12.2024.
//

import SwiftUI

struct CoinsView: View {
    //@ObservedObject var viewModel: CoinsViewModel
    @State var viewModel = CoinsViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("viewModel.coinElement?.message ?? ")
                .onAppear() {
                    //viewModel.fetchData()
                    viewModel.fetchDataCoinList()
                }
                
        }
        .background(Color.red)
        .padding()
    }
}

