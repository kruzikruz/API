//
//  APIApp.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import SwiftUI

@main
struct APIApp: App {
    
    @StateObject private var eventsapicall = EventsAPICall()
    @StateObject private var teamsapicall = TeamsAPICall()
    
    var body: some Scene {
        WindowGroup {
            TeamsView().environmentObject(teamsapicall)
            EventsView().environmentObject(eventsapicall)
        }
        
    }
}

