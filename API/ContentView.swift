//
//  ContentView.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//
import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            TeamsView()
                .tabItem() {
                    Image(systemName: "soccerball.inverse")
                    Text("Scores")
                }
            EventsView()
                .tabItem() {
                    Image(systemName: "star")
                    Text("Favourites")
                }
            EventsView()
                .tabItem() {
                    Image(systemName: "camera.viewfinder")
                    Text("Watch")
                }
            EventsView()
                .tabItem() {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            EventsView()
                .tabItem() {
                    Image(systemName: "arrow.clockwise")
                    Text("Refresh")
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
