//
//  CTFEventVuew.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 23/4/2567 BE.
//

import SwiftUI

struct CTFEventView: View {
    @ObservedObject var ctfEventManager = CTFEventManager()
    @ObservedObject var ctfTeamManager = CTFTeamManager()
    
    @State private var selectedEvent: CTFEventsModel?
    @State private var isPopoverPresented = false
    
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .frame(width: 100, height:30)
            
            Text("Hi, CTF Player!")
                .font(.system(size: 20, design: .rounded))
                .fontWeight(.semibold)
                .padding(.leading, 5)
                
            Spacer()
        }
        .padding(.leading, 20)
        
        Divider()
         .frame(height: 1)
         .padding(.horizontal, 30)
         .background(Color.gray)
        
        ScrollView {
            VStack(spacing: 0) {
                CarouselSlider(ctfEventManager: ctfEventManager)
                
                CTFTeamView(ctfTeamManager: ctfTeamManager)
                
                ForEach(ctfEventManager.events) { event in
                    EventRow(event: event)
                        .onTapGesture {
                            selectedEvent = event
                            isPopoverPresented = true
                        }
                } // close foreach
            } // close vstack
        } // close scroll view
        .popover(isPresented: $isPopoverPresented) {
            if let selectedEvent = selectedEvent {
                SafariView(url: URL(string: selectedEvent.ctftime_url)!)
            }
        } // close popover
        .onAppear() {
            ctfEventManager.fetchData()
            ctfTeamManager.fetchData()
        }
        .refreshable {
            ctfEventManager.fetchData()
            ctfTeamManager.fetchData()
        }
    }
}
