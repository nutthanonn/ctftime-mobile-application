//
//  HackerNewsWebView.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 21/4/2567 BE.
//

import SwiftUI
import WebKit

struct HackerNewsWebView: UIViewRepresentable {
    let urlString: String?

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
