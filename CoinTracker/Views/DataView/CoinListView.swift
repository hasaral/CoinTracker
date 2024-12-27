//
//  DataView.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//

import SwiftUI

struct CoinListView: View {

    @State var viewModel = CoinListViewModel(coinTypes: CoinDictModel(type: "", market: "", fromsymbol: "", tosymbol: "", flags: 0, lasttradeid: "", price: 0, lastupdate: 0, lastvolume: 0, lastvolumeto: 0, volumehour: 0, volumehourto: 0, volumeday: 0, volumedayto: 0, volume24Hour: 0, volume24Hourto: 0 ))
    @Namespace var namespace
    @EnvironmentObject var model: ModelSet
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]

    var body: some View {
        
        ZStack {
            if model.showDetail {
                CoinDetailView(namespace: namespace, coinName: $model.selectedCoin, setIndex: $model.selectedCoinIndex)
            }
            
            VStack {
                HStack() {
                    Image(systemName: "circle.fill")
                     .foregroundColor(viewModel.statusT ? Color.green : Color.red)
                     .padding(.leading, 10)
                    Spacer()
                    Text("coins")
                        .font(Font.custom("Poppins-Regular", size: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.green)

                }
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 5) {
                        if viewModel.statusT {
                            ForEach(viewModel.coinSets) { coinType in
                                CoinItem(namespace: namespace, coinData: viewModel.coinDictionary[coinType.rawValue] ?? CoinDictModel(type: "", market: "", fromsymbol: "", tosymbol: "", flags: 0, lasttradeid: "", price: 0, lastupdate: 0, lastvolume: 0, lastvolumeto: 0, volumehour: 0, volumehourto: 0, volumeday: 0, volumedayto: 0, volume24Hour: 0, volume24Hourto: 0 ), indexSet: coinType.hashValue)
                                    .padding()
                            }
                        } else {
                             
                            VStack(alignment: .center) {
                                Text("Waiting ....")
                                    .font(.title).bold()
                                    .foregroundColor(.green.opacity(0.7))
                                LoadingView()
                                 
                            }
                        }
                    }
                }
            }
        }.padding(.top,10)
            .navigationBarHidden(true)
        
//        List {
//            Image(systemName: "circle.fill")
//                .foregroundColor(viewModel.statusT ? Color.green : Color.red)
//            
//            ForEach(viewModel.coinSets) { coinType in
//                VStack {
//                    HStack {
//                        CoinItem(coinData: viewModel.coinDictionary[coinType.rawValue] ?? CoinDictModel(type: "", market: "", fromsymbol: "", tosymbol: "", flags: 0, lasttradeid: "", price: 0, lastupdate: 0, lastvolume: 0, lastvolumeto: 0, volumehour: 0, volumehourto: 0, volumeday: 0, volumedayto: 0, volume24Hour: 0, volume24Hourto: 0 ))
//                        
////                        Text(viewModel.coinDictionary[coinType.rawValue]?.fromsymbol ?? "")
////                        Text(viewModel.coinDictionary[coinType.rawValue]?.market ?? "")
////                            Spacer()
////                            Text(viewModel.valueText(for: coinType, type: "1"))
////                                .frame(alignment: .trailing)
////                                .font(.body)
//                    }
//                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.listenToStream()
         }
    }
}

#Preview {
    NavigationStack {
        CoinListView()
    }
}
