//
//  Events Schema.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import Foundation

struct Events: Identifiable, Decodable {
    let id: Int
    let date: String
    var title: Title
    var status: String
    var slug: String
    var author: Int
    var seasons: [Int]
    var featured_media: Int
    var format: String
    var day: String
    var teams: [Int]
    var main_results: [String]
    var _embedded:Embedded?
    
    static var `default`: Events {
        Events(id: 0, date: "2022-12-18T16:45:09", title: Title(rendered: ""), status: "", slug: "1", author: 1,seasons: [0], featured_media: 1, format: "", day: "", teams: [0], main_results: [])
    }
    
    struct Title: Decodable {
        var rendered: String
    }
}


extension Events: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Events, rhs: Events) -> Bool {
        return lhs.id == rhs.id
    }
}
