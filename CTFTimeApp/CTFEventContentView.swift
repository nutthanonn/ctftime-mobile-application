//
//  CTFEventContentView.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 23/4/2567 BE.
//

import SwiftUI

struct CTFEventContentView: View {
    let day: Int
    let hour: Int
    
    var body: some View {
        Image(systemName: "clock.fill")
            .foregroundColor(.orange)
            .imageScale(.small)
        
        if day == 0 {
            Text("\(hour) hours")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
        }
        else if hour == 0 {
            Text("\(day) day")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
        }
        else {
            Text("\(day) day \(hour) hours")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
        }
    }
}
