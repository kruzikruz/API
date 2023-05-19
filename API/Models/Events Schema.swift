//
//  Events Schema.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import Foundation

struct Events: Identifiable, Decodable {
    let id: Int
    var title: Title
    var status: String
    var slug: String
    var author: Int
    var featured_media: Int
    var format: String
    var day: String
    var teams: [Int]
    
    static var `default` : Events {
        Events(id: 0, title: Title(rendered: ""), status: "", slug: "1", author: 1, featured_media: 1, format: "", day: "", teams: [1])
    }
    
    
    struct Title: Decodable {
        var rendered: String
    }
}
