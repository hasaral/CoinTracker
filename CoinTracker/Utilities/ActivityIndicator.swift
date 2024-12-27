//
//  ActivityIndicator.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//


import SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    func makeUIView(context: Context) -> some UIView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        
        activityIndicatorView.color = UIColor.green
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ActivityIndicator()
        }
    }
}