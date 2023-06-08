//
//  Teams Schema.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import Foundation

// MARK: - Teams
struct Teams: Identifiable, Decodable {
    let id: Int
    let date: String
    let slug: String
    let status: String
    let type: String
    let link: String
    let title: TeamName
    var _embedded:Embedded?
    
    
    struct TeamName: Codable {
        let rendered: String
    }
    
    struct Embedded : Codable{
        
        enum CodingKeys: String, CodingKey {
            case featuredmedia = "wp:featuredmedia"
        }
        var featuredmedia : [Media]?
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            featuredmedia = try? values.decode([Media].self, forKey: .featuredmedia)
        }
    }
    
    struct Media : Codable{
        
        var source_url: String?
        var media_details: MediaDetails?
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            source_url = try values.decode(String.self, forKey: .source_url)
            media_details = try values.decode(MediaDetails.self, forKey: .media_details)
        }
    }
    
    struct MediaDetails : Codable{
        
        var sizes: MediaSizes?
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            sizes = try values.decode(MediaSizes.self, forKey: .sizes)
        }
    }
    
    struct MediaSizes : Codable{
        
        var medium: MediaSize?
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            medium = try values.decode(MediaSize.self, forKey: .medium)
        }
    }
    
    
    struct MediaSize : Codable{
        
        var source_url: String?
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            source_url = try values.decode(String.self, forKey: .source_url)
        }
    }
    
}
