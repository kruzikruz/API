//
//  Author Schema.swift
//  API
//
//  Created by Kornel Krużewski on 17/05/2023.
//

import Foundation
import SwiftUI

struct UserData: Codable {
    let id: Int
    let name: String
    let description: String
    let link: URL
    let slug: String
}



/*
 //
 //  Author Schema.swift
 //  API
 //
 //  Created by Kornel Krużewski on 17/05/2023.
 //

 import Foundation
 import SwiftUI

 struct UserData: Codable {
     let id: Int
     let name: String
     let description: String
     let link: URL
     let slug: String
     let avatarURLs: AvatarURLs
 }

 struct AvatarURLs: Codable {
     let small: String
     let medium: String
     let large: String

     private enum CodingKeys: String, CodingKey {
         case small = "24"
         case medium = "48"
         case large = "96"
     }
 }
 */
