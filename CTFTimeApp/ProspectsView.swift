import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case home, write_up, hacker_news
    }
    
    let filter: FilterType
    
    @ViewBuilder
    var destinationView: some View {
        switch filter {
        default:
            Text("Placeholder for other filter types")
        }
    }
    
    var title: String {
        switch filter {
        case .home:
            return "Home"
        case .write_up:
            return "Write-up"
        case .hacker_news:
            return "hacker_news"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                switch filter {
                case .home:
                    CTFEventView()
                case .hacker_news:
                    HackerNewsView()
                default:
                    Text("Other views go here")
                }
            } // close vstack
        }
    }
}
