//
//  APIApp.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import SwiftUI

@main
struct APIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
