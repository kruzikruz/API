//
//  PlayersAPICall.swift
//  API
//
//  Created by Kornel Krużewski on 21/07/2023.
//

import SwiftUI

class PlayersAPICall: ObservableObject {
    @Published var players: [Player] = []
    
    // MARK: - Players
    
    func getPlayers(forTeam teamID: Int) {
        var allPlayers: [Player] = []
        
        DispatchQueue.global().async {
            self.fetchPlayers(teamID: teamID, page: 1) { players, totalPages in
                allPlayers.append(contentsOf: players)
                
                if totalPages > 1 {
                    for page in 2...totalPages {
                        self.fetchPlayers(teamID: teamID, page: page) { players, _ in
                            allPlayers.append(contentsOf: players)
                            
                            if page == totalPages {
                                DispatchQueue.main.async {
                                    self.players = allPlayers
                                }
                            }
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.players = allPlayers
                    }
                }
            }
        }
    }
    
    private func fetchPlayers(teamID: Int, page: Int, completion: @escaping ([Player], Int) -> Void) {
        guard var urlComponents = URLComponents(string: "https://amatorkamp.pl/wp-json/sportspress/v2/players") else {
            fatalError("Brak adresu URL")
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "current_team_id", value: String(teamID)), // id drużyny
            URLQueryItem(name: "per_page", value: "100"), // liczba wyników na stronie
            URLQueryItem(name: "page", value: String(page)) // numer strony
        ]
        
        guard let url = urlComponents.url else {
            fatalError("Nieprawidłowe komponenty adresu URL")
        }
        
        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Błąd żądania: ", error)
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
                
                // Wypisz dane JSON otrzymane z API
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Otrzymane dane JSON dla drużyny o ID \(teamID), strona \(page):")
                    //print(jsonString)
                }
                
                do {
                    let decodedPlayers = try JSONDecoder().decode([Player].self, from: data)
                    let totalPages = response.allHeaderFields["X-WP-TotalPages"] as? Int ?? 0
                    completion(decodedPlayers, totalPages)
                } catch let error {
                    print("Błąd dekodowania: ", error)
                    completion([], 0)
                }
            } else {
                completion([], 0)
            }
        }

        dataTask.resume()
    }
}
