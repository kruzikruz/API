import SwiftUI

class EventsAPICall: ObservableObject {
    @Published var events: [Events] = []
    // MARK: - Events
    
    func getEvents() {
        var allEvents: [Events] = []
        
        DispatchQueue.global().async {
            self.fetchEvents(page: 1) { events, totalPages in
                allEvents.append(contentsOf: events)
                
                if totalPages > 1 {
                    for page in 2...totalPages {
                        self.fetchEvents(page: page) { events, _ in
                            allEvents.append(contentsOf: events)
                            
                            if page == totalPages {
                                DispatchQueue.main.async {
                                    self.events = allEvents
                                }
                            }
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.events = allEvents
                    }
                }
            }
        }
    }
    
    private func fetchEvents(page: Int, completion: @escaping ([Events], Int) -> Void) {
        guard var urlComponents = URLComponents(string: "https://amatorkamp.pl/wp-json/sportspress/v2/events") else {
            fatalError("Missing URL")
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "100"), // liczba wyników na stronie
            URLQueryItem(name: "page", value: String(page)) // numer strony
        ]
        
        guard let url = urlComponents.url else {
            fatalError("Invalid URL components")
        }
        
        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                completion([], 0)
                return
            }

            guard let response = response as? HTTPURLResponse else {
                completion([], 0)
                return
            }

            if response.statusCode == 200 {
                guard let data = data else {
                    completion([], 0)
                    return
                }
                
                do {
                    let decodedEvents = try JSONDecoder().decode([Events].self, from: data)
                    let totalPages = response.allHeaderFields["X-WP-TotalPages"] as? Int ?? 0
                    completion(decodedEvents, totalPages)
                } catch let error {
                    print("Error decoding: ", error)
                    completion([], 0)
                }
            } else {
                completion([], 0)
            }
        }

        dataTask.resume()
    }
}
