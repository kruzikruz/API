//
//  Home.swift
//  API
//
//  Created by Kornel Krużewski on 10/07/2023.
//

import SwiftUI
import Kingfisher

struct Home: View {
    @EnvironmentObject var eventsAPICall: EventsAPICall
    @EnvironmentObject var teamsAPICall: TeamsAPICall
    @State private var isShowingEventsView = false

    var body: some View {
        VStack{
            NavigationView {
                VStack {
                    NavBar()
                    ScrollView(showsIndicators: false) {
                        VStack {
                            HStack {
                                // Live Scores
                                Text("Ostatnie mecze")
                                    .font(.custom("Inter Semi Bold", size: 18))
                                    .foregroundColor(Color(#colorLiteral(red: 0.47, green: 0.47, blue: 0.95, alpha: 1)))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                // See All Button
                                NavigationLink(destination: EventsView(),
                                    isActive: $isShowingEventsView) {
                                        Text("Zobacz wszystkie")
                                            .font(.custom("Inter Semi Bold", size: 13))
                                            .foregroundColor(Color(#colorLiteral(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)))
                                            .multilineTextAlignment(.trailing)
                                    }
                                    .padding(.trailing, 10)
                                    .simultaneousGesture(
                                        TapGesture().onEnded {
                                            self.isShowingEventsView = true
                                        }
                                    )
                            }
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(eventsAPICall.events.prefix(5), id: \.id) { event in
                                        NavigationLink(destination: DetailEvents(event: event)) {
                                            ZStack() {
                                                Group {
                                                    Rectangle()
                                                        .foregroundColor(.clear)
                                                        .frame(width: 172, height: 173)
                                                        .background(Color(red: 0.21, green: 0.21, blue: 0.21))
                                                        .cornerRadius(12)
                                                        .offset(x: 0, y: 0)
                                                    Text("1")
                                                        .font(Font.custom("Inter", size: 24).weight(.bold))
                                                        .lineSpacing(20)
                                                        .foregroundColor(.white)
                                                        .offset(x: -46, y: 53.50)
                                                    Text("0")
                                                        .font(Font.custom("Inter", size: 24).weight(.bold))
                                                        .lineSpacing(20)
                                                        .foregroundColor(.white)
                                                        .offset(x: 45.50, y: 53.50)
                                                    Text("72 mins")
                                                        .font(Font.custom("Inter", size: 8).weight(.medium))
                                                        .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.92))
                                                        .offset(x: 0, y: 53.50)
                                                    Text(teamsAPICall.getTeamName3(for: event.teams[0]))
                                                        .lineLimit(5)
                                                        .truncationMode(.tail)
                                                        .font(Font.custom("Inter", size: 10).weight(.medium))
                                                        .foregroundColor(.white)
                                                        .offset(x: -46, y: 12.50)
                                                    Text(teamsAPICall.getTeamName3(for: event.teams[1]))
                                                        .lineLimit(5)
                                                        .truncationMode(.tail)
                                                        .font(Font.custom("Inter", size: 10).weight(.medium))
                                                        .foregroundColor(.white)
                                                        .offset(x: 45, y: 12.50)
                                                    Text("VS")
                                                        .font(Font.custom("Inter", size: 10).weight(.semibold))
                                                        .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.92))
                                                        .offset(x: 0, y: -20.50)
                                                    HStack(spacing: 10) {
                                                        Text("LIVE")
                                                            .font(Font.custom("Inter", size: 8).weight(.semibold))
                                                            .foregroundColor(.white)
                                                    }
                                                    .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                                                    .frame(width: 30, height: 14)
                                                    .background(Color(red: 0.99, green: 0.06, blue: 0))
                                                    .cornerRadius(10)
                                                    .offset(x: 57, y: -66.50)
                                                    ZStack() {
                                                        Rectangle()
                                                            .foregroundColor(.clear)
                                                            .frame(width: 30, height: 30)
                                                            .background(
                                                                Image("Amatorka")
                                                                    .resizable()
                                                                    .frame(width: 30, height: 30)
                                                            )
                                                            .offset(x: 0, y: 0)
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .offset(x: -46, y: -20.91)
                                                    ZStack() {
                                                        Rectangle()
                                                            .foregroundColor(.clear)
                                                            .frame(width: 30, height: 30)
                                                            .background(
                                                                Image("Amatorka")
                                                                    .resizable()
                                                                    .frame(width: 30, height: 30)
                                                            )
                                                            .offset(x: 0, y: 0)
                                                    }
                                                    .frame(width: 30, height: 30)
                                                    .offset(x: 45, y: -19)
                                                }
                                            }
                                            .frame(width: 172, height: 173)
                                        }
                                    }
                                }
                            }
                            .onAppear {
                                eventsAPICall.getEvents()
                                teamsAPICall.getTeams()
                            }                        
                        }
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
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(EventsAPICall())
            .environmentObject(TeamsAPICall())
    }
}


