import SwiftUI

class TeamsAPICall: ObservableObject {
    @Published var teams: [Teams] = []
    
    // MARK: - Teams
    
    func getTeams() {
        var allTeams: [Teams] = []
        
        DispatchQueue.global().async {
            self.fetchTeams(page: 1) { teams, totalPages in
                allTeams.append(contentsOf: teams)
                
                if totalPages > 1 {
                    for page in 2...totalPages {
                        self.fetchTeams(page: page) { teams, _ in
                            allTeams.append(contentsOf: teams)
                            
                            if page == totalPages {
                                DispatchQueue.main.async {
                                    self.teams = allTeams
                                }
                            }
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.teams = allTeams
                    }
                }
            }
        }
    }
    
    private func fetchTeams(page: Int, completion: @escaping ([Teams], Int) -> Void) {
        guard var urlComponents = URLComponents(string: "https://amatorkamp.pl/wp-json/sportspress/v2/teams") else {
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
                    let decodedTeams = try JSONDecoder().decode([Teams].self, from: data)
                    let totalPages = response.allHeaderFields["X-WP-TotalPages"] as? Int ?? 0
                    completion(decodedTeams, totalPages)
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
