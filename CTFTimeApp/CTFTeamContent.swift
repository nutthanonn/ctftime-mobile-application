//
//  CTFTeamContent.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 5/5/2567 BE.
//

import SwiftUI

struct CTFTeamContent: View {
    var team: TeamInfo
    
    var point:String {
        String(format: "%.2f", team.points)
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack {
                if let logoURL = URL(string: team.teamData?.logo ?? "") {
                    AsyncImage(url: logoURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width:30, height:30)
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:30, height:30)
                                .cornerRadius(100)
                        case .failure:
                            Image("flag")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:30, height:30)
                                .cornerRadius(100)
                        @unknown default:
                            ProgressView()
                        }
                    }
                } else {
                    Image("flag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:30, height:30)
                }
                
                Text("\(team.team_name)")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(2)
            } // close hstack
            
            Text("Rating \(point)")
                .font(.system(size: 11))
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding(.top, 2)
        } // close vstack
        .padding(3)
    }
}
