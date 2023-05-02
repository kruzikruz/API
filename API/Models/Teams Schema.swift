//
//  Teams Schema.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import Foundation

// MARK: - Teams
struct Teams: Identifiable, Decodable {
    var id: Int
    var type: String
    var link: String
    var template: String
    var abbreviation: String
    var url: String
}

