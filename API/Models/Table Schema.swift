//
//  Table Schema.swift
//  API
//
//  Created by Kornel Krużewski on 18/05/2023.
//

import Foundation

// MARK: - Table
struct Table: Codable, Identifiable {
        let id: Int
        let date: String
        let dateGMT: String
        let guid: Guid
        let modified: String
        let modifiedGMT: String
        let slug: String
        let status: String
        let type: String
        let link: String
        let title: Title
        let content: Content
        let featuredMedia: Int
        let menuOrder: Int
        let template: String
        let leagues: [Int]
        let seasons: [Int]
        let data: [String: TeamData]
        let links: Links

        struct Guid: Codable {
            let rendered: String
        }

        struct Title: Codable {
            let rendered: String
        }

        struct Content: Codable {
            let rendered: String
            let protected: Bool
        }

        struct TeamData: Codable {
            let p: String
            let w: String
            let d: String
            let l: String
            let f: String
            let a: String
            let gd: String
            let pts: String
            let name: String
            let pos: Int
        }

        struct Links: Codable {
            let selfLink: [Link]
            let collection: [Link]
            let about: [Link]
            let wpAttachment: [Link]
            let wpTerm: [WpTerm]
            let curies: [Curies]

            enum CodingKeys: String, CodingKey {
                case selfLink = "self"
                case collection, about
                case wpAttachment = "wp:attachment"
                case wpTerm = "wp:term"
                case curies
            }
        }

        struct Link: Codable {
            let href: String
        }

        struct WpTerm: Codable {
            let taxonomy: String
            let embeddable: Bool
            let href: String
        }

        struct Curies: Codable {
            let name: String
            let href: String
            let templated: Bool
        }
    }
