//
//  Card.swift
//  API
//
//  Created by Kornel Krużewski on 15/05/2023.
//

import SwiftUI
import Foundation


struct Card: Identifiable {
    var id  = UUID()
//  var image : String
    var title : String
    var description : String
    
}

var testData:[Card] = [

 //Card(image: "dancer1", title: "String", description: "String"),
 
     
 Card( title: "Choose A Tasty", description: "When you order Eat Street , we'll hook you up with exclusive  coupons."),

 Card( title: "Discover Places", description: "We make it simple to find the food you crave. Enter your address and let"),
 
 Card( title: "Pick Up Or", description: "We make food ordering fast , simple and free - no matter if you order"),

]
