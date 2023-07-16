import SwiftUI
import Kingfisher

struct NavigationBar2: View {
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: "https://amatorkamp.pl/wp-content/uploads/2022/03/logo@2x-260x300.png"))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
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

extension TeamsAPICall {
    // Funkcja zwracająca nazwę zespołu na podstawie identyfikatora zespołu
    func getTeamName3(for teamId: Int) -> String {
        if let team = teams.first(where: { $0.id == teamId }) {
            return team.title.rendered
        } else {
            return ""
        }
    }
    
    // Extension returning the image URL based on the team identifier
    func getTeamImageURL(for teamId: Int) -> String? {
        if let team = teams.first(where: { $0.id == teamId }) {
            if let ogImage = team.yoast_head_json.og_image.first {
                return ogImage.url
            }
        }
        return nil
    }
}


struct EventsView: View {
    @EnvironmentObject var eventsAPICall: EventsAPICall
    @EnvironmentObject var teamsAPICall: TeamsAPICall
    //@State private var teams: [Teams] = [] // Dodaj stan dla kolekcji obiektów Teams
    //@Environment(\.colorScheme) var colorScheme
    
    // Metoda do tworzenia deep linka na podstawie identyfikatora wydarzenia
    func createDetailEventDeepLink(eventID: Int) -> URL? {
        let deepLinkURLString = "yourappname://detailevent?eventID=\(eventID)"
        return URL(string: deepLinkURLString)
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavBar()
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(eventsAPICall.events.filter { $0.seasons == [135] }, id: \.id) { event in
                            NavigationLink(destination: DetailEvents(event: event)) {
                                ZStack(alignment: .bottom) {
                                    VStack(spacing: 0) {
                                        HStack(spacing: 0) {
                                            VStack {
                                                if event.main_results.isEmpty {
                                                            Text(formatDateShort(event.date))
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 12))
                                                                .padding(.trailing, 12)
                                                        } else {
                                                            Text("FT")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 12))
                                                                .padding(.trailing, 12)
                                                        }
                                                    
                                            }
                                            .clipped()
                                            .padding(5)
                                            VStack(alignment: .trailing) {
                                                HStack(spacing: 4) {
                                                    if let imageURL = teamsAPICall.getTeamImageURL(for: event.teams[0]) {
                                                        KFImage(URL(string: imageURL))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 25, height: 25)
                                                    } else {
                                                        Image("myImage")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 25, height: 25)
                                                    }
                                                    Text(teamsAPICall.getTeamName3(for: event.teams[0]))
                                                        .font(.custom("Source Sans Pro", size: 12))
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 12, weight: .regular, design: .default))
                                                }
                                                .padding(.top, 6)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .clipped()
                                                HStack(spacing: 4) {
                                                    if let imageURL = teamsAPICall.getTeamImageURL(for: event.teams[1]) {
                                                        KFImage(URL(string: imageURL))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 25, height: 25)
                                                    } else {
                                                        Image("myImage")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 25, height: 25)
                                                    }
                                                    Text(teamsAPICall.getTeamName3(for: event.teams[1]))
                                                        .font(.custom("Source Sans Pro", size: 12))
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
                                                if event.main_results.isEmpty {
                                                    Text(formatTime(event.date))
                                                        .foregroundColor(.white)
                                                        .padding(5)
                                                } else {
                                                    Text(event.main_results[0])
                                                        .foregroundColor(.white)
                                                        .padding(5)
                                                    
                                                    if event.main_results.count > 1 {
                                                        Text(event.main_results[1])
                                                            .foregroundColor(.white)
                                                            .padding(5)
                                                    }
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
                    teamsAPICall.getTeams()
                }
            }
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(red: 30/255, green: 30/255, blue: 30/255),
                            Color(red: 46/255, green: 46/255, blue: 46/255)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarHidden(true)
        }
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors: [
                        Color(red: 30/255, green: 30/255, blue: 30/255),
                        Color(red: 46/255, green: 46/255, blue: 46/255)
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            )
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarHidden(true)
    }
}

func formatDateShort(_ dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    if let date = dateFormatter.date(from: dateString) {
        dateFormatter.dateFormat = "dd/MM"
        return dateFormatter.string(from: date)
    } else {
        return "Invalid Date"
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView()
            .environmentObject(EventsAPICall())
            .environmentObject(TeamsAPICall())
    }
}
