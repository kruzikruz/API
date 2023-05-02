//
//  EventsAPICall.swift
//  API
//
//  Created by Kornel Krużewski on 02/05/2023.
//


import SwiftUI

class EventsAPICall: ObservableObject {
    @Published var events: [Events] = []
    
    // MARK: - Events
    func getEvents() {
        guard let url = URL(string: "https://amatorkamp.pl/wp-json/sportspress/v2/events") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedEvents = try JSONDecoder().decode([Events].self, from: data)
                        self.events = decodedEvents
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}

