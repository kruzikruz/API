//
//  Events Schema.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import Foundation

struct Events: Identifiable, Decodable {
    var id: Int
    var title: Title
    var status: String
    var slug: String
    var author: Int
    var featured_media: Int
    var format: String
    var day: String
    
    struct Title: Decodable {
        var rendered: String
    }
}
