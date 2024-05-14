//
//  EventRow.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 4/5/2567 BE.
//

import SwiftUI

struct EventRow: View {
    let event: CTFEventsModel
    
    @State private var isPresentingEventView = false

    
    var startColor: Color {
        let startDate = event.start_date_time ?? Date()
        let currentDate = Date()
        
        return startDate < currentDate ? .orange : .green
    }
    
    
    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: URL(string: event.logo)) { phase in
                    switch phase {
                    case .empty:
                        Image("flag")
                            .resizable()
                            .frame(maxWidth: 60, maxHeight: 60)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 60, maxHeight: 60)
                    case .failure:
                        Image("flag")
                            .resizable()
                            .frame(maxWidth: 60, maxHeight: 60)
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(event.title)
                        .lineLimit(1)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                
                    Spacer()
                    
                    Button(action: {
                        self.isPresentingEventView = true
                    }) {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    .sheet(isPresented: $isPresentingEventView) {
                        EventEditView(startDate: event.start_date_time ?? Date(), endDate: event.finish_date_time ?? Date(), title: event.title, urlString: event.ctftime_url, note: event.description)
                    }
                } // close hstack
                
                HStack {
                    Text(event.format)
                        .font(.system(size: 12))
                        .foregroundColor(.blue)
                    
                    Text("weight: \(Int(event.weight))")
                        .font(.system(size: 12))
                        .foregroundColor(.blue)
                } // close hstack
                
                HStack {
                    Text("Start: \(event.start_date_string)")
                        .font(.system(size: 11))
                        .fontWeight(.medium)
                        .foregroundColor(startColor)
                    
                    Spacer()
                    
                    CTFEventContentView(day: event.duration.days, hour: event.duration.hours)
                } // close hstack
            } // close vstack
        } // close hstack
        .padding()
        .background(Color.white)
    }
}
