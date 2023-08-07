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
        @EnvironmentObject var tableapicall: TableAPICall
        @EnvironmentObject var postsapicall: PostsAPICall
        @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
        @State public var shouldNavigateToDetail = false
        @State public var selectedIndex = 0 // Domyślny indeks tabu
    
    var body: some View {
        GeometryReader{
            let safeArea = $0.safeAreaInsets
            let size = $0.size
            TabView {
                Home()
                    .tabItem() {
                        Image(systemName: "house.circle.fill")
                        Text("Home")
                    }
                EventsView()
                    .tabItem() {
                        Image(systemName: "soccerball.inverse")
                        Text("Mecze")
                    }
                TableView()
                    .ignoresSafeArea(.container, edges: .top)
                    .tabItem() {
                        Image(systemName: "tablecells")
                        Text("Tabela")
                    }
                News()
                    .tabItem() {
                        Image(systemName: "newspaper.fill")
                        Text("News")
                    }
                ContentViewAPI()
                    .tabItem() {
                        Image(systemName: "line.3.horizontal")
                        Text("Menu")
                    }
                    
            }
            .accentColor(Color.green)
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(Color.black.opacity(100))
                
                // Use this appearance when scrolling behind the TabView:
                UITabBar.appearance().standardAppearance = appearance
                // Use this appearance when scrolled all the way up:
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TeamsAPICall())
            .environmentObject(EventsAPICall())
            .environmentObject(PostsAPICall())
            .environmentObject(TableAPICall())

    }
}
