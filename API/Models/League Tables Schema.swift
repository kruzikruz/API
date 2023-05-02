//
//  League Tables Schema.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import Foundation

// MARK: - Teams
struct League: Identifiable, Decodable {
    let id: Int
    let date, dateGmt: String
    let modified, modifiedGmt, slug, status: String
    let type: String
    let link: String
    let title: Title
}

// MARK: - GUID
struct Title: Codable {
    let rendered: String
}
