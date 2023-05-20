
import SwiftUI

struct Team: Codable {
    let id: Int
    let slug: String
    // Dodaj inne właściwości zgodnie z modelem danych zwracanych przez API
}

struct ContentView2: View {
    let teams: [Int] = [3215, 3220]
    
    var body: some View {
        List(teams, id: \.self) { teamID in
            TeamRow(teamID: teamID)
        }
    }
}

struct TeamRow: View {
    let teamID: Int
    @State private var team: Team? = nil
    
    var body: some View {
        VStack {
            if let team = team {
                Text("Team ID: \(team.id)")
                Text("Team Name: \(team.slug)")
                // Dodaj inne widoki zależne od danych zwróconych przez API
            } else {
                Text("Loading...")
                    .onAppear {
                        fetchData()
                    }
            }
        }
    }
    
    func fetchData() {
        guard let url = URL(string: "https://amatorkamp.pl/wp-json/sportspress/v2/teams/\(teamID)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let team = try JSONDecoder().decode(Team.self, from: data)
                DispatchQueue.main.async {
                    self.team = team
                }
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
