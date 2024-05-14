//
//  HackerNewsDetailView.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 21/4/2567 BE.
//

import SwiftUI

struct HackerNewsDetailView: View {
    let url: String?
    let title: String?

    var body: some View {
        HackerNewsWebView(urlString: url)
            .navigationTitle(title ?? "")
    }
}

#Preview {
    HackerNewsDetailView(url: "www.google.com", title: "Google")
}
