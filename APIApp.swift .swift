//
//  APIApp.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import SwiftUI

/// Headline Type
var EMPTY_IMAGE_URL = "https://seferihisar.com/wp-content/themes/shnews/assets/img/no-thumb.jpg"

@main
struct APIApp: App {
    //@UIApplicationDelegateAdaptor(DeepLinkHandler.self) var deepLinkHandler
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @StateObject private var eventsapicall = EventsAPICall()
    @StateObject private var teamsapicall = TeamsAPICall()
    @StateObject private var postsapicall = PostsAPICall()
    @StateObject private var tableapicall = TableAPICall()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(teamsapicall)
                .environmentObject(eventsapicall)
                .environmentObject(postsapicall)
                .environmentObject(tableapicall)
                .onOpenURL { url in
                    print(url.absoluteString)}
        }
    }
}
