import SwiftUI
import Kingfisher


struct NavigationBar2: View {
    var body: some View {
        VStack {
            HStack {
                Image("livescore")
                    .resizable()
                    .frame(width: 120, height: 20)
                Spacer()
                HStack(spacing: 16) {
                    Button {
                        // akcja
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .tint(.white)
                    .frame(width: 24, height: 24)
                    Button {
                        // akcja
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                    .tint(.white)
                    .frame(width: 24, height: 24)
                }
            }
            .padding([.leading, .trailing], 12)
            Divider()
                .ignoresSafeArea()
                .overlay(Color.white)
        }
    }
}

struct EventsView: View {
    @EnvironmentObject var eventsAPICall: EventsAPICall
    @Environment(\.colorScheme) var colorScheme
    @State private var teamNames: [Int: String] = [:] // Zaktualizowana tablica przechowująca nazwy zespołów
    @State private var teamLogos: [Int: URL] = [:] // Zaktualizowana tablica przechowująca adresy URL logotypów zespołów
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar2()
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(eventsAPICall.events, id: \.id) { event in
                            NavigationLink(destination: DetailEvents(event: event)) {
                                ZStack(alignment: .bottom) {
                                    VStack(spacing: 0) {
                                        HStack(spacing: 0) {
                                            VStack {
                                                Text(event.day)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 8))
                                            }
                                            .clipped()
                                            .padding(5)
                                            VStack(alignment: .trailing) {
                                                HStack(spacing: 4) {
                                                    if let logoURL = teamLogos[event.teams[0]] {
                                                        KFImage(logoURL)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 22, height: 22)
                                                    }
                                                    Text(getTeamName(for: event.teams[0])) // Użyj pierwszego identyfikatora zespołu
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 12, weight: .regular, design: .default))
                                                }
                                                .padding(.top, 6)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .clipped()
                                                HStack(spacing: 4) {
                                                    if let logoURL = teamLogos[event.teams[1]] {
                                                        KFImage(logoURL)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 22, height: 22)
                                                    }
                                                    Text(getTeamName(for: event.teams[1])) // Użyj drugiego identyfikatora zespołu
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 12, weight: .regular, design: .default))
                                                }
                                                .padding(.top, 6)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .clipped()
                                            }
                                            .frame(height: 60, alignment: .leading)
                                            .clipped()
                                            VStack {
                                                if !event.main_results.isEmpty {
                                                    Text(event.main_results[0])
                                                        .foregroundColor(.white)
                                                        .padding(5)
                                                }
                                                if !event.main_results.isEmpty {
                                                    Text(event.main_results[1])
                                                        .foregroundColor(.white)
                                                        .padding(5)
                                                }
                                            }
                                            .frame(height: 60, alignment: .center)
                                            .clipped()
                                        }
                                    }
                                    .padding(10)
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                        .background(Color(red: 0.09, green: 0.09, blue: 0.09))
                        .cornerRadius(15)
                    }
                }
                
                
                
                .onAppear {
                    eventsAPICall.getEvents()
                    fetchTeamData()
                }
            }
        }
        
    }
    
    // Funkcja do pobierania danych zespołów (nazwy i logotypy) na podstawie identyfikatorów zespołów
    func fetchTeamData() {
        let pageSize = 10 // Liczba zespołów pobieranych na jednej stronie
        var currentPage = 1 // Numer aktualnej strony
        var allTeams: [Teams] = [] // Tablica przechowująca wszystkie zespoły
        
        func fetchPage() {
            guard let url = URL(string: "https://amatorkamp.pl/wp-json/sportspress/v2/teams?page=\(currentPage)&per_page=\(pageSize)") else {
                return
            }
            
            let task: URLSessionDataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let teams = try JSONDecoder().decode([Teams].self, from: data)
                    allTeams.append(contentsOf: teams)
                    
                    if teams.count == pageSize {
                        currentPage += 1
                        fetchPage()
                    } else {
                        for team in allTeams {
                            teamNames[team.id] = team.title.rendered
                            if let logoURLString = team.acf?.team_logo,
                               let logoURL = URL(string: logoURLString) {
                                teamLogos[team.id] = logoURL
                            }
                        }
                    }
                } catch {
                    print("Error decoding teams data: \(error)")
                }
            }
            
            task.resume()
        }
        
        fetchPage() // Dodane wywołanie funkcji fetchPage()
    }

    
    // Funkcja zwracająca nazwę zespołu na podstawie identyfikatora zespołu
    func getTeamName(for teamId: Int) -> String {
        return teamNames[teamId] ?? ""
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView().environmentObject(EventsAPICall())
    }
}
