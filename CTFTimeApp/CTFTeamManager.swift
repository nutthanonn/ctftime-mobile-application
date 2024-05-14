//
//  CTFTeamManager.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 4/5/2567 BE.
//

import Foundation


class CTFTeamManager: ObservableObject {
    @Published var events = [TeamInfo]()
    
    func fetchData() {
//        if let url = URL(string: "https://ctftime.org/api/v1/top/") {
        if let url = URL(string: "https://ctf-time-fetch.onrender.com/api/get") {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, _, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([String: [TeamInfo]].self, from: safeData)
                            if let teamStandings = results["2024"] {
                                DispatchQueue.main.async {
                                    self.events = teamStandings
                                }
                            }
                        } catch {
                            print("Decode error eiei \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
