//
//  CTFTeamView.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 4/5/2567 BE.
//

import SwiftUI

struct CTFTeamView: View {
    @ObservedObject var ctfTeamManager: CTFTeamManager
    
    var teamInf: [TeamInfo] {
        return ctfTeamManager.events
    }
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<teamInf.count, id:\.self) { index in
                        let team = teamInf[index]
                        let first:CGFloat = index == 0 ? 20 : 5
                        
                        VStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .frame(width: 100, height: 100)
                                .overlay(
                                    CTFTeamContent(team: team)
                                )
                                .background(Color.gray
                                    .opacity(0.03)
                                                .shadow(color: .black, radius: 2, x: 0, y: 4)
                                                .blur(radius: 5, opaque: false)
                                )
                        } // close vstack
                        .padding(.leading, first)
                    } // close foreach
                } // close hstack
                .frame(height: 120)
            } // close scroll view
        } // close zstack
        .ignoresSafeArea()
    }
}
