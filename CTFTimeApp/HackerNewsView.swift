//
//  HackerNewsView.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 21/4/2567 BE.
//

import SwiftUI

struct HackerNewsView: View {
    @ObservedObject var hackerNewsManager = HackerNewsManager()
    @State private var searchText = ""

       
       var body: some View {
           NavigationView {
               VStack {
                   SearchBar(text: $searchText)
                   
                   List(hackerNewsManager.posts.filter {
                       self.searchText.isEmpty ? true : $0.title.localizedCaseInsensitiveContains(searchText)
                   }) { post in
                       NavigationLink(destination: HackerNewsDetailView(url: post.url, title: post.title)) {
                           HStack {
                               VStack {
                                   Text("\(post.points)")
                                       .fontWeight(.bold)
                                       .foregroundColor(.green)
                                   
                                   Text("Upvotes")
                                       .font(.footnote)
                                       .font(.system(size: 10))
                                       .foregroundColor(.primary)
                               }// close vstack
                               
                               VStack(alignment: .leading) {
                                   Text(post.title)
                                       .font(.headline)
                                       .padding(1)
                                   
                                   HStack {
                                       HStack{
                                           Text("by")
                                               .font(.system(size: 10))
                                               .foregroundColor(.secondary)
                                               
                                           Text("_\(post.author)_")
                                               .font(.system(size: 10))
                                               .fontWeight(.bold)
                                               .foregroundColor(.secondary)
                                               .frame(width: 90, alignment: .leading)
                                               .offset(x:-5)
                                           
                                       } //close hstack
                                       
                                       HStack {
                                           Image(systemName: "clock.fill")
                                               .foregroundColor(.orange)
                                               .imageScale(.small)
                                           
                                           Spacer(minLength: 2)
                                           
                                           Text("\(post.date_time)")
                                               .foregroundStyle(.secondary)
                                               .font(.system(size: 10))
                                       } // close hstack
                                   } // close hstack
                               } // close vstack
                           } // close hstack
                       } // close navigation likn
                   } // close list
               .navigationBarTitle("Hacker News")
               }
           }.onAppear {
               hackerNewsManager.fetchData()
        } // close on appear
    }
}

#Preview {
    HackerNewsView()
}
