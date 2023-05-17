//
//  ContentView.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//
import SwiftUI

struct ContentView: View {

    @EnvironmentObject var teamsapicall: TeamsAPICall
    @EnvironmentObject var eventsapicall: EventsAPICall
    
    var body: some View {
        TabView {
            TeamsView()
                .tabItem() {
                    Image(systemName: "soccerball.inverse")
                    Text("Mecze")
                }
            EventsView()
                .tabItem() {
                    Image(systemName: "star")
                    Text("Ulubione")
                }
            ContentView2()
                .tabItem() {
                    Image(systemName: "tablecells")
                    Text("Tabela")
                }
            News()
                .tabItem() {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            EventsView()
                .tabItem() {
                    Image(systemName: "arrow.clockwise")
                    Text("Odśwież")
                }
        }
        .accentColor(.green)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.black.opacity(0.9))
            
            // Use this appearance when scrolling behind the TabView:
            //UITabBar.appearance().standardAppearance = appearance
            // Use this appearance when scrolled all the way up:
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TeamsAPICall())
            .environmentObject(EventsAPICall())
            .environmentObject(PostsAPICall())

    }
}
