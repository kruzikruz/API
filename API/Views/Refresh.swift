//
//  Refresh.swift
//  API
//
//  Created by Kornel Krużewski on 12/06/2023.
//

import SwiftUI

struct ContentViewAPI: View {

    @State private var eventId = "6649"
    
    @State private var firstHalfScoreTeam33 = ""
    @State private var secondHalfScoreTeam33 = ""
    @State private var goalsTeam33 = "1"
    @State private var outcomeTeam33 = "win"
    
    @State private var firstHalfScoreTeam1390 = ""
    @State private var secondHalfScoreTeam1390 = ""
    @State private var goalsTeam1390 = "1"
    @State private var outcomeTeam1390 = "przegrana"
    
    @EnvironmentObject var eventsAPICall: EventsAPICall
    @EnvironmentObject var teamsAPICall: TeamsAPICall
    @State private var selectedTeam: Events? = nil
    @State private var selectedTeamId: Int? = nil

    func updateResults() {
        let results: [String: [String: Any]] = [
            "33": [
                "firsthalf": firstHalfScoreTeam33,
                "secondhalf": secondHalfScoreTeam33,
                "goals": goalsTeam33,
                "poss": "",
                "outcome": [outcomeTeam33]
            ],
            "1390": [
                "firsthalf": firstHalfScoreTeam1390,
                "secondhalf": secondHalfScoreTeam1390,
                "goals": goalsTeam1390,
                "poss": "",
                "outcome": [outcomeTeam1390]
            ],
            "0": [
                "goals": "Bramki",
                "outcome": "Wynik"
            ]
        ]
        
        guard let url = URL(string: "https://amatorkamp.pl/wp-json/sportspress/v2/events/\(eventId)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let loginString = "TEST"
        guard let loginData = loginString.data(using: .utf8) else {
            return
        }
        let base64LoginString = loginData.base64EncodedString()
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: ["results": results], options: [])
            request.httpBody = jsonData
        } catch {
            print("Error creating JSON data: \(error)")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error updating results: \(error)")
            }
        }.resume()
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Picker("Team", selection: $selectedTeamId) {
                    ForEach(eventsAPICall.events.filter { $0.seasons == [135] }, id: \.id) { event in
                        Text("\(event.id) - \(event.slug)")
                            .tag(event.id)
                    }
                }
                .id(UUID())
                .padding()
                .onAppear {
                    eventsAPICall.getEvents()
                }
                .onReceive(selectedTeamId.publisher) { id in
                    selectedTeam = eventsAPICall.events.first(where: { $0.id == id })
                }
                
                ///TEST
                TextField("Event ID", text: $eventId)
                    .padding()
                
                VStack {
                    TextField("1 połowa", text: $firstHalfScoreTeam33)
                        .foregroundStyle(.white)
                        .padding(.all)
                        .border(Color(UIColor.white))
                        .padding(.leading)
                        .padding(.trailing)
                    TextField("2 połowa", text: $secondHalfScoreTeam33)
                        .foregroundStyle(.white)
                        .padding(.all)
                        .border(Color(UIColor.white))
                        .padding(.leading)
                        .padding(.trailing)
                    TextField("Bramki", text: $goalsTeam33)
                        .foregroundStyle(.white)
                        .padding(.all)
                        .border(Color(UIColor.white))
                        .padding(.leading)
                        .padding(.trailing)
                    TextField("win/przegrana", text: $outcomeTeam33)
                        .accentColor(Color.green)
                        .foregroundStyle(.white)
                        .padding(.all)
                        .border(Color(UIColor.white))
                        .padding(.leading)
                        .padding(.trailing)
                }
                .padding()
                
                VStack {
                    TextField("1 połowa", text: $firstHalfScoreTeam1390)
                        .foregroundStyle(.white)
                        .padding(.all)
                        .border(Color(UIColor.white))
                        .padding(.leading)
                        .padding(.trailing)
                    TextField("2 połowa", text: $secondHalfScoreTeam1390)
                        .foregroundStyle(.white)
                        .padding(.all)
                        .border(Color(UIColor.white))
                        .padding(.leading)
                        .padding(.trailing)
                    TextField("Bramki", text: $goalsTeam1390)
                        .foregroundStyle(.white)
                        .padding(.all)
                        .border(Color(UIColor.white))
                        .padding(.leading)
                        .padding(.trailing)
                    TextField("win/przegrana", text: $outcomeTeam1390)
                        .foregroundStyle(.white)
                        .padding(.all)
                        .border(Color(UIColor.white))
                        .padding(.leading)
                        .padding(.trailing)
                }
                .padding()
                
                Button("Update Results", action: updateResults)
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color(red: 18/255, green: 19/255, blue: 32/255))
        }
    }
}

struct ContentViewAPI_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewAPI()
            .environmentObject(TableAPICall())
            .environmentObject(EventsAPICall()) // Dodane
            .environmentObject(TeamsAPICall()) // Dodane
    }
}
