//
//  DetailTable.swift
//  API
//
//  Created by Kornel Krużewski on 12/06/2023.
//

import SwiftUI
import Kingfisher
import ACarousel

struct DetailTable: View {
    
    let table: Table
    var safeArea: EdgeInsets
    var size: CGSize
    var selectedRowID: String
    var selectedDatum: Datum?
    @EnvironmentObject var eventsAPICall: EventsAPICall
    @EnvironmentObject var teamsAPICall: TeamsAPICall
    @EnvironmentObject var tableAPICall: TableAPICall
    @StateObject private var playersAPICall = PlayersAPICall()
    @State private var dataLoaded = false
    @State private var showProgressView = true
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    // Call this function when you want to fetch players for a given team ID
    func fetchPlayersForTeam(teamID: Int) {
        playersAPICall.getPlayers(forTeam: teamID)
    }
    
    var teamImageURL: String? {
            guard let teamID = Int(selectedRowID), let team = teamsAPICall.teams.first(where: { $0.id == teamID }),
                  let ogImage = team.yoast_head_json.og_image.first else {
                return nil
            }
            return ogImage.url
        }
    
    // Updated teamImageURL method
    var teamBacgrouundImageURL: String? {
        guard let teamID = Int(selectedRowID), let team = teamsAPICall.teams.first(where: { $0.id == teamID }) else {
            return nil
        }
        return team.bacgroundimage_url
    }
    

    var body: some View {
        if dataLoaded {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ArtWork()
                

                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                    
                    Color.clear
                        .frame(height: 50)
                        .padding(.top, -34)
                        .zIndex(1)
                }
                
                VStack {
                    VStack(alignment: .center, spacing: 14) {
                        HStack {
                            Text("Tabela")
                                .font(.custom("Poppins", size: 14))
                                .tracking(0.26)
                                .lineSpacing(24.53)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                // Akcja, która zostanie wykonana po kliknięciu przycisku
                            }) {
                                Text("Zobacz wszystko")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.82, green: 0.71, blue: 1))
                            }
                        }
                        .frame(width: 310, height: 31.5391)
                    }
                    .padding(.horizontal)
                    .padding(.top, 14.01759)
                    .padding(.bottom, 14.01715)
                    .frame(width: 350, alignment: .center)
                    .background(Color(red: 0.13, green: 0.13, blue: 0.2))
                    .cornerRadius(7.88478)
                    //
                    ACarousel(playersAPICall.players.prefix(5), id: \.id, spacing: 9,headspace: 9)  { player in
                        HStack(spacing: 20) {
                                HStack(alignment: .center) {
                                    VStack{
                                        HStack(alignment: .center) {
                                            VStack(alignment: .center) {
                                                Image("AMP")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 30, height: 30)
                                                Text("Nogat Malbork")
                                                    .font(
                                                        Font.custom("Poppins", size: 7)
                                                            .weight(.medium)
                                                    )
                                                    .kerning(0.26283)
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(.white)
                                                HStack(spacing: 5) {
                                                    ForEach(0..<5) { index in
                                                        Circle()
                                                            .fill(.blue)
                                                            .frame(width: 10, height: 10)
                                                    }
                                                }
                                            }
                                            .frame(width: 80)
                                            .padding()
                                            VStack(alignment: .center, spacing: 20) {
                                                Text("20:00")
                                                    .font(
                                                        Font.custom("Poppins", size: 24)
                                                            .weight(.medium)
                                                    )
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(.white)
                                                Text("29 LIP")
                                                    .font(
                                                        Font.custom("Poppins", size: 7)
                                                            .weight(.medium)
                                                    )
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(.white)
                                            }
                                            .frame(width: 100) // Ustawienie alignment na .center oraz szerokości na 100
                                            
                                            VStack(alignment: .center) {
                                                Image("AMP")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 30, height: 30)
                                                Circle()
                                                    .fill(.blue)
                                                    .frame(width: 10, height: 10)
                                                Text("Amatorka Mikołajki Pomorskie")
                                                    .font(
                                                        Font.custom("Poppins", size: 7)
                                                            .weight(.medium)
                                                    )
                                                    .kerning(0.26283)
                                                    .multilineTextAlignment(.center)
                                                    .foregroundColor(.white)
                                                //.lineLimit(nil)
                                                HStack(spacing: 5) {
                                                    Circle()
                                                        .fill(.blue)
                                                        .frame(width: 10, height: 10)
                                                    ForEach(0..<5) { index in
                                                        Circle()
                                                            .fill(.blue)
                                                            .frame(width: 10, height: 10)
                                                    }
                                                }
                                            }
                                            .frame(width: 80)
                                            .padding()
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.top, 14.01759)
                                    .padding(.bottom, 14.01715)
                                    .frame(width: 350, alignment: .center)
                                    .background(Color(red: 0.13, green: 0.13, blue: 0.2))
                                    .cornerRadius(7.88478)
                                }
                            }
                        }
                        .frame(height: 160)
                    //
                    VStack(alignment: .center, spacing: 14) {
                        HStack {
                            Text("Najlepsi strzelcy")
                                .font(.custom("Poppins", size: 13))
                                .kerning(0.23504)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                // Akcja, która zostanie wykonana po kliknięciu przycisku
                            }) {
                                Text("Zobacz wszystko")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.82, green: 0.71, blue: 1))
                            }
                        }
                        .frame(width: 310, height: 31.5391)
                        HStack {
                            Text("Zawodnik")
                                .font(.custom("Poppins", size: 10))
                                .kerning(0.23504)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("Bramki")
                                .font(.custom("Poppins", size: 10))
                                .kerning(0.26283)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 310, height: 10)
                        
                        ForEach(playersAPICall.players.prefix(5), id: \.id)  { player in
                            HStack {
                                Circle()
                                    .foregroundColor(.blue)
                                    .frame(width: 18, height: 18)
                                    .overlay(
                                        KFImage(URL(string: teamImageURL ?? ""))
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 18, height: 18)
                                                            .mask(Circle())
                                    )
                                    .mask(Circle())
                                
                                Text("\(player.title.rendered)")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("3")
                                    .font(.custom("Poppins", size: 12).weight(.medium))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 310, height: 25)
                            
                            if player.id != playersAPICall.players.prefix(5).last?.id {
                                    Divider()
                                        .background(Color.gray)
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 14.01759)
                    .padding(.bottom, 14.01715)
                    .frame(width: 350, alignment: .center)
                    .background(Color(red: 0.13, green: 0.13, blue: 0.2))
                    .cornerRadius(7.88478)
                    
                    VStack(alignment: .center, spacing: 14) {
                        HStack {
                            Text("Najlepsi asystenci")
                                .font(.custom("Poppins", size: 13))
                                .kerning(0.23504)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                // Akcja, która zostanie wykonana po kliknięciu przycisku
                            }) {
                                Text("Zobacz wszystko")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.82, green: 0.71, blue: 1))
                            }
                        }
                        .frame(width: 310, height: 31.5391)
                        
                        HStack {
                            Text("Zawodnik")
                                .font(.custom("Poppins", size: 10))
                                .kerning(0.23504)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("Asysty")
                                .font(.custom("Poppins", size: 10))
                                .kerning(0.26283)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 310, height: 10)
                        
                        ForEach(playersAPICall.players.prefix(5), id: \.id)  { player in
                            HStack {
                                Circle()
                                    .foregroundColor(.blue)
                                    .frame(width: 18, height: 18)
                                    .overlay(
                                        KFImage(URL(string: teamImageURL ?? ""))
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 18, height: 18)
                                                            .mask(Circle())
                                    )
                                    .mask(Circle())
                                
                                Text("\(player.title.rendered)")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("3")
                                    .font(.custom("Poppins", size: 12).weight(.medium))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 310, height: 25)
                            
                            if player.id != playersAPICall.players.prefix(5).last?.id {
                                    Divider()
                                        .background(Color.gray)
                                }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 14.01759)
                    .padding(.bottom, 14.01715)
                    .frame(width: 350, alignment: .center)
                    .background(Color(red: 0.13, green: 0.13, blue: 0.2))
                    .cornerRadius(7.88478)
                    
                }
                .padding(.top, 10)
                .zIndex(0)
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
            
        }
        .onAppear {
             eventsAPICall.getEvents()
             teamsAPICall.getTeams()
             if let teamID = Int(selectedRowID) {
                 fetchPlayersForTeam(teamID: teamID)
             }
         }
         .preferredColorScheme(.dark)
         .coordinateSpace(name: "SCROLL")
     } else {
         // Placeholder or loading view while data is being fetched
         ZStack{
             Color.black
                 .ignoresSafeArea()
             ProgressView()
                 .progressViewStyle(CircularProgressViewStyle(tint: .green))
                 .scaleEffect(2)
         }
         .navigationBarBackButtonHidden(true)
             .onAppear {
                 eventsAPICall.getEvents()
                 teamsAPICall.getTeams()
                 if let teamID = Int(selectedRowID) {
                     fetchPlayersForTeam(teamID: teamID)
                 }
             }
             .onReceive(playersAPICall.$players) { players in
                 if !players.isEmpty {
                     showProgressView = false
                     dataLoaded = true
                 } else {
                     DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                         // Sprawdź ponownie, czy w międzyczasie dane się nie pojawiły
                         if playersAPICall.players.isEmpty {
                             showProgressView = false
                             dataLoaded = false
                         }
                     }
                 }
             }
     }
 }
    
    @ViewBuilder
    func ArtWork() -> some View {
        let height = size.height * 0.45
        
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            KFImage(URL(string: teamBacgrouundImageURL ?? ""))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay(
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        .black.opacity(0 - progress),
                                        .black.opacity(0.1 - progress),
                                        .black.opacity(0.3 - progress),
                                        .black.opacity(0.5 - progress),
                                        .black.opacity(0.8 - progress),
                                        .black.opacity(1),
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        VStack(spacing: 0) {
                            
                            if let imageURL = teamImageURL {
                                    KFImage(URL(string: imageURL))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 140, height: 140)
                                        .padding(.bottom, 60)
                                } else {
                                    Image("AMP")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 140, height: 140)
                                        .padding(.bottom, 60)
                                }
                            Text(selectedDatum?.name ?? "")
                            Text("\(selectedDatum?.pos ?? "") MIEJSCE W LIDZE.")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.top, 15)
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress))
                        .padding(.bottom, 10)
                        .offset(y: minY < 0 ? minY : 0)
                    }
                )
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            eventsAPICall.getEvents()
            teamsAPICall.getTeams()
            if let teamID = Int(selectedRowID) {
                fetchPlayersForTeam(teamID: teamID)
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress = minY / height
            
            HStack(spacing: 15) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
            .overlay(
                Text(selectedDatum?.name ?? "")
                    .fontWeight(.semibold)
                    .offset(y: -titleProgress > 0.75 ? 0 : 45)
                    .clipped()
                    .animation(.easeInOut(duration: 0.25), value: -titleProgress > 0.75)
            )
            .padding(.top, safeArea.top + 45)
            .padding([.horizontal, .bottom], 15)
            .background(
                Color.black.opacity(-progress > 1 ? 1 : 0)
            )
            .offset(y: -minY)
        }
        .frame(height: 35)
        //.ignoresSafeArea(.container, edges: .top)
    }
    
}
        
struct DetailTable_Previews: PreviewProvider {
    static var previews: some View {
        DetailTable(table: Table.default, safeArea: .init(), size: .init(), selectedRowID: .init())
            .environmentObject(EventsAPICall())
            .environmentObject(TeamsAPICall())
            .environmentObject(TableAPICall())
            .environmentObject(PlayersAPICall())
    }
}

