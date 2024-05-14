//
//  CarouselSlider.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 4/5/2567 BE.
//

import SwiftUI

struct CarouselSlider: View {
    @ObservedObject var ctfEventManager: CTFEventManager
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()
    @State private var selectedImageIndex: Int = 0
    
    
    var filteredEvents: [CTFEventsModel] {
        return ctfEventManager.events
    }
    
    var body: some View {
        ZStack {
            // Background Color
            Color.white
                .ignoresSafeArea()

            TabView(selection: $selectedImageIndex) {
                ForEach(0..<min(filteredEvents.prefix(5).count, 5), id: \.self) { index in
                    let event = filteredEvents[index]
                    let startDate = event.start_date_time ?? Date()
                    let currentDate = Date()
                    
                    let tabBackground: LinearGradient = startDate < currentDate ?
                        LinearGradient(gradient: Gradient(colors: [
                            Color(#colorLiteral(red: 0.9921568627, green: 0.7490196078, blue: 0.3764705882, alpha: 1)), // #fdbf60
                            Color(#colorLiteral(red: 0.9921568627, green: 0.7137254902, blue: 0.3058823529, alpha: 1)), // #fdb64e
                            Color(#colorLiteral(red: 0.9960784314, green: 0.6745098039, blue: 0.2274509804, alpha: 1)), // #feac3a
                            Color(#colorLiteral(red: 0.9960784314, green: 0.6352941176, blue: 0.1450980392, alpha: 1)), // #fea225
                            Color(#colorLiteral(red: 1, green: 0.5960784314, blue: 0, alpha: 1)) // #ff9800
                        ]), startPoint: .topTrailing, endPoint: .bottomLeading) :
                        LinearGradient(gradient: Gradient(colors: [
                            Color(#colorLiteral(red: 0.9921568627, green: 0.9921568627, blue: 0.9921568627, alpha: 1)), // #fafafa
                            Color(#colorLiteral(red: 0.9960784314, green: 0.9647058824, blue: 0.9843137255, alpha: 1)), // #fef6fb
                            Color(#colorLiteral(red: 1, green: 0.9490196078, blue: 0.9568627451, alpha: 1)), // #fff2f4
                            Color(#colorLiteral(red: 1, green: 0.9411764706, blue: 0.8980392157, alpha: 1)), // #fff0e5
                            Color(#colorLiteral(red: 1, green: 0.9490196078, blue: 0.8431372549, alpha: 1)) // #fff2d7
                        ]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    
                    let startOrNot: Bool = startDate < currentDate
                    let text:String = startOrNot ? "CTF has started" : "Start: \(event.start_date_string)"
                    let textColor: Color = startOrNot ? .red : .orange
                    let titleColor: Color = startOrNot ? .white : .black
                    let formatColor: Color = startOrNot ? .blue : .green
                    
                    
                    HStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            Text(event.title)
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(titleColor)
                            
                            HStack {
                                Text(event.format)
                                    .font(.system(size: 13))
                                    .foregroundColor(formatColor)

                                
                                Text("weight: \(Int(event.weight))")
                                    .font(.system(size: 13))
                                    .foregroundColor(titleColor)
                            }
                            
                            Text(text)
                                .font(.system(size: 12))
                                .foregroundColor(textColor)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        } // close vstack
                        
                        Spacer()
                        
                        AsyncImage(url: URL(string: event.logo)) { phase in
                            switch phase {
                            case .empty:
                                Image("flag")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                            case .success(let image):
                                image
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(100)
                            case .failure:
                                Image("flag")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                            @unknown default:
                                EmptyView()
                            }
                        } // close async image
                    }   // close stack
                    .padding()
                    .frame(width: 350, height: 100)
                    .background(tabBackground)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                } // close for each
            } // close tab view
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()

//             navigation dot
            HStack {
                ForEach(0..<min(filteredEvents.prefix(5).count, 5), id: \.self) { index in
                    // Step 13: Create Navigation Dots
                    Capsule()
                        .fill(Color.gray.opacity(selectedImageIndex == index ? 1 : 0.33))
                        .frame(width: 8, height: 8)
                        .onTapGesture {
                            selectedImageIndex = index
                        }
                } // close for each
                .offset(y: 70) // Step 15: Adjust Dots Position
            } // close hstack
        } // close zstack
        .frame(height: 150)
        .onReceive(timer) { _ in
            withAnimation(.default) {
                selectedImageIndex = (selectedImageIndex + 1) % min(filteredEvents.prefix(5).count, 5)
            }
        } // close on receive
    }
}
