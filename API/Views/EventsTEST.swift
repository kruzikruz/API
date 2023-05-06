//
//  EventsTEST.swift
//  API
//
//  Created by Kornel Krużewski on 03/05/2023.
//

import SwiftUI

let animalGroups = [
    AnimalGroup(
        name: "1. Amatorka Mikołajki Pomorskie 36 11 0 9",
        animals: [
            Animal(name: "Kiwi"),
            Animal(name: "Takahē"),
            Animal(name: "Weka")
        ]
    ),
    AnimalGroup(
        name: "Rodło Trzciano",
        animals: [
            Animal(name: "Forest gecko"),
            Animal(name: "Barrier skink"),
            Animal(name: "Tuatara")
        ]
    ),
    AnimalGroup(
        name: "Błyskawica Postolin",
        animals: [
            Animal(name: "Long-tailed bat"),
            Animal(name: "Short-tailed bat")
        ]
    )
]

struct ContentView2: View {
    var body: some View {
        AnimalGroupsView(groups: animalGroups)
    }
}

struct AnimalGroupsView: View {
    var groups: [AnimalGroup]
    
    var body: some View {
        NavigationStack {
            List(groups) { group in
                NavigationLink(group.name) {
                    AnimalGroupView(group: group)
                }
            }
            .navigationTitle("Tabela")
        }
    }
}

struct AnimalGroupView: View {
    var group: AnimalGroup
    
    var body: some View {
        List(group.animals) { animal in
            Text(animal.name)
        }
        .navigationTitle(group.name)
    }
}

struct AnimalGroup: Identifiable {
    let name: String
    let animals: [Animal]
    
    var id: String { name }
}

struct Animal: Identifiable {
    let name: String
    
    var id: String { name }
}
