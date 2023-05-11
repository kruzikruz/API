//
//  APIApp.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import SwiftUI

///Headline Type
var EMPTY_IMAGE_URL = "https://seferihisar.com/wp-content/themes/shnews/assets/img/no-thumb.jpg"


@main
struct APIApp: App {
    
    @StateObject private var eventsapicall = EventsAPICall()
    @StateObject private var teamsapicall = TeamsAPICall()
    @StateObject private var postsapicall = PostsAPICall()

    
    var body: some Scene {
            WindowGroup {
                ContentView()
                    .environmentObject(teamsapicall)
                    .environmentObject(eventsapicall)
                    .environmentObject(postsapicall)
            }
        
    }
    
    
    
    
    
}

