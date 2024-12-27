//
//  CourseItem.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//



import SwiftUI

struct CoinItem: View {
    
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 9
        formatter.currencyCode = "USD"
        return formatter
    }()
    var namespace: Namespace.ID
    var coinData:  CoinDictModel
    var indexSet: Int
    
    @EnvironmentObject var model: ModelSet
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    Text(coinData.market ?? "")
                        .font(Font.custom("Poppins-Regular", size: 19))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.green)
                        .matchedGeometryEffect(id: "description\(indexSet)", in: namespace)
                }
                
                HStack {
                    Image(coinData.fromsymbol ?? "-")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                    
                    Text(coinData.fromsymbol ?? "")
                        .font(Font.custom("Poppins-Bold", size: 24))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "title\(indexSet)", in: namespace)
                        .foregroundColor(.white)
                    
                    Text(self.currencyFormatter.string(from: NSNumber(value:coinData.price ?? 0.0)) ?? "")
                        .font(Font.custom("Poppins-Regular", size: 25))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    .matchedGeometryEffect(id: "subtitle\(indexSet)", in: namespace)
                    .foregroundColor(.white.opacity(0.7))
                        .padding(.leading, -30)
                }
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.black)
                    //.frame(maxHeight: .infinity, alignment: .bottom)
                    .cornerRadius(18)
                    .blur(radius: 1)
                    .matchedGeometryEffect(id: "blur\(indexSet)", in: namespace)
            )
            .overlay {
                    RoundedRectangle(cornerRadius: 18)
                    .strokeBorder(Color.green, lineWidth: 0.5)
                }
        }

//        .background(
//            Color.clear
//                .padding(20)
//                //.matchedGeometryEffect(id: "image\(coinData.index)", in: namespace)
//                .offset(y: -30)
//        )
//        .mask(
//            RoundedRectangle(cornerRadius: 30)
//                //.matchedGeometryEffect(id: "mask\(coinData.index)", in: namespace)
//        )
//        .overlay(
//            Image(horizontalSizeClass == .compact ? "Waves 1" : "Waves 2")
//                .frame(maxHeight: .infinity, alignment: .bottom)
//                .offset(y: 0)
//                .opacity(0)
//                //.matchedGeometryEffect(id: "waves\(coinData.index)", in: namespace)
//        )
        .frame(height: 90)
        .onTapGesture {
            withAnimation(.openCard) {
                model.showDetail = true
                model.selectedCoin = coinData.fromsymbol ?? "?"
                model.selectedCoinIndex = indexSet
            }
        }
    }
}


