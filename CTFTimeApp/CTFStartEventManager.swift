//
//  CTFEventStartManager.swift
//  CTFTimeApp
//
//  Created by Nutthanon on 4/5/2567 BE.
//

import Foundation


class CTFStartEventManager: ObservableObject {
    @Published var events = [CTFEventsModel]()
    
    func fetchData() {
        let currentTime = Date().timeIntervalSince1970
        
        if let url = URL(string: "https://ctftime.org/api/v1/events/?start=\(Int(currentTime))") {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, _, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let decodedEvents = try decoder.decode([CTFEventsModel].self, from: safeData)
                            DispatchQueue.main.async {
                                self.events = decodedEvents
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
