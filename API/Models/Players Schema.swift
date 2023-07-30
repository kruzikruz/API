//
//  Players Schema.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let player = try? JSONDecoder().decode(Player.self, from: jsonData)

import Foundation

// MARK: - Struktura Player
struct Player: Decodable {
    let id: Int
    let slug: String
    //let date, dateGmt: String
    //let modified, modifiedGmt: String
    //let leagues: [Int]
    //let seasons: [Int]
    //let positions: Int
    let number: Int?
    let title: GUIDTitle
}

struct GUIDTitle: Codable {
    let rendered: String
}
