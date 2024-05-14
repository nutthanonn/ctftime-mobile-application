import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProspectsView(filter: .home)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProspectsView(filter: .hacker_news)
                .tabItem {
                    Label("Hacker News", systemImage: "newspaper")
                }
        } // close tab view
    } // close view
}

#Preview {
    ContentView()
}
