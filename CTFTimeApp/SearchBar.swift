//
//  SearchBar.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 23/4/2567 BE.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal)
        }
    }
}
