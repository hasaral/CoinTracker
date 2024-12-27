//
//  CourseView.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//


import SwiftUI
import Charts

struct CoinDetailView: View {
    var namespace: Namespace.ID
    @Binding var coinName: String
    var isAnimated = true
    @Binding var setIndex: Int
    
    @State var viewState: CGSize = .zero
    @State var showSection = false
    @State var appear = [false, false, false]
 
    @EnvironmentObject var model: ModelSet
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: appear[0] ? 0 : 30))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3))
            .modifier(OutlineModifier(cornerRadius: viewState.width / 3))
            .shadow(color: Color("Shadow").opacity(0.5), radius: 30, x: 0, y: 10)
            .scaleEffect(-viewState.width/500 + 1)
            .background(Color("Shadow").opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isAnimated ? drag : nil)
            .ignoresSafeArea()
            
            Button {
                isAnimated ?
                withAnimation(.closeCard) {
                    model.showDetail = false
                    //model.selectedCourse = 0
                }
                : presentationMode.wrappedValue.dismiss()
            } label: {
                CloseButton()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
            
//            LogoView(image: course.logo)
//                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                .padding(20)
//                .matchedGeometryEffect(id: "logo\(course.index)", in: namespace)
//                .ignoresSafeArea()
//                .accessibility(hidden: true)
        }
        .zIndex(1)
        .onAppear { fadeIn() }
        .onChange(of: model.showDetail) { show in
           fadeOut()
        }
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .background(
                VStack {
                    Chart {
                        ForEach(candle_btc) { candle in
                            RectangleMark(x: .value("Day",candle.day),
                                          yStart: .value("Low Price", candle.lowPrice),
                                          yEnd: .value("High Price", candle.highPrice),
                                          width:9)
                        }
                    }
                    .padding(.top, 10)
                    .frame(maxHeight: 380)
                }
//                Image("BTC")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding(20)
//                    .matchedGeometryEffect(id: "image\(setIndex)", in: namespace)
//                    .offset(y: scrollY > 0 ? -scrollY : 0)
//                    .accessibility(hidden: true)
            )
            .mask(
                RoundedRectangle(cornerRadius: appear[0] ? 0 : 30)
                    .matchedGeometryEffect(id: "mask\(setIndex)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
//            .overlay(
//                Image(horizontalSizeClass == .compact ? "Waves 1" : "Waves 2")
//                    .frame(maxHeight: .infinity, alignment: .bottom)
//                    .offset(y: scrollY > 0 ? -scrollY : 0)
//                    .scaleEffect(scrollY > 0 ? scrollY / 500 + 1 : 1)
//                    .opacity(1)
//                    .matchedGeometryEffect(id: "waves\(setIndex)", in: namespace)
//                    .accessibility(hidden: true)
//            )
            .overlay(
                VStack(alignment: .leading, spacing: 16) {
                    Text(model.selectedCoin)
                        .font(.title).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                        .matchedGeometryEffect(id: "title\(setIndex)", in: namespace)
                    
                    Text("8 videos - 12 hours".uppercased())
                        .font(.footnote).bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                        .matchedGeometryEffect(id: "subtitle\(setIndex)", in: namespace)
                    
                    Text("A complete guide to designing for iOS 14 with videos, examples and design...")
                        .font(.footnote)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary.opacity(0.7))
                        .matchedGeometryEffect(id: "description\(setIndex)", in: namespace)
                    
                    Divider()
                        .foregroundColor(.secondary)
                        .opacity(appear[1] ? 1 : 0)
                    
                    HStack {
                        //LogoView(image: "Avatar 1")
                        Text("Taught by Meng To and Stephanie Diep")
                            .font(.footnote.weight(.medium))
                            .foregroundStyle(.secondary)
                    }
                    .opacity(appear[1] ? 1 : 0)
                    .accessibilityElement(children: .combine)
                }
                .padding(20)
                .padding(.vertical, 10)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .cornerRadius(30)
                        .blur(radius: 30)
                        .matchedGeometryEffect(id: "blur\(setIndex)", in: namespace)
                        .opacity(appear[0] ? 0 : 1)
                )
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .backgroundStyle(cornerRadius: 30)
                        .opacity(appear[0] ? 1 : 0)
                )
                //.offset(y: scrollY > 0 ? -scrollY * 1.8 : 0)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: 200)
                .padding(20)
            )
        }
        .frame(height: 500)
    }
    
 
    
    func close() {
        withAnimation {
            viewState = .zero
        }
        withAnimation(.closeCard.delay(0.2)) {
            model.showDetail = false
            model.selectedCoin = ""
        }
    }
    
    var drag: some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged { value in
                guard value.translation.width > 0 else { return }
                
                if value.startLocation.x < 100 {
                    withAnimation {
                        viewState = value.translation
                    }
                }
                
                if viewState.width > 120 {
                    close()
                }
            }
            .onEnded { value in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.openCard) {
                        viewState = .zero
                    }
                }
            }
    }
    
    func fadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    func fadeOut() {
        withAnimation(.easeIn(duration: 0.1)) {
            appear[0] = false
            appear[1] = false
            appear[2] = false
        }
    }
}

 
struct Candle: Identifiable {
    var id = UUID().uuidString
    var name: String
    var day: Int
    var lowPrice: Double
    var highPrice: Double
    var openPrice: Double
    var closePrice: Double
}

var candle_btc : [Candle] = [ Candle(name: "BTC", day: 1, lowPrice: 2000, highPrice: 2500, openPrice: 2200, closePrice: 2400),Candle(name: "BTC", day: 2, lowPrice: 3000, highPrice: 3500, openPrice: 3200, closePrice: 3400),Candle(name: "BTC", day: 3, lowPrice: 4000, highPrice: 4500, openPrice: 4200, closePrice: 4400),Candle(name: "BTC", day: 4, lowPrice: 5000, highPrice: 5500, openPrice: 5200, closePrice: 5400),Candle(name: "BTC", day: 5, lowPrice: 6000, highPrice: 6500, openPrice: 6200, closePrice: 6400),Candle(name: "BTC", day: 6, lowPrice: 7000, highPrice: 7500, openPrice: 7200, closePrice: 7400),Candle(name: "BTC", day: 7, lowPrice: 7000, highPrice: 7500, openPrice: 7200, closePrice: 7400),Candle(name: "BTC", day: 8, lowPrice: 7000, highPrice: 7500, openPrice: 7200, closePrice: 7400),Candle(name: "BTC", day: 9, lowPrice: 7000, highPrice: 7500, openPrice: 7200, closePrice: 7400),Candle(name: "BTC", day: 10, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 11, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 12, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 13, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 14, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 15, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 16, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 17, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 18, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 19, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 20, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 21, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 22, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 23, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 24, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 25, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 26, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 27, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400),Candle(name: "BTC", day: 28, lowPrice: 17000, highPrice: 47500, openPrice: 27200, closePrice: 7400)  ]
