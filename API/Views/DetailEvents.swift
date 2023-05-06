//
//  DetailEvents.swift
//  API
//
//  Created by Kornel Krużewski on 02/05/2023.
//

import SwiftUI

struct DetailEvents: View {
    
    let name: String
    
    var body: some View {
            Text(name)
                .font(.largeTitle)
        }
    
}
struct DetailEvents_Previews: PreviewProvider {
    static var previews: some View {
        DetailEvents(name: "Amatorka Mikołajki Pomorskie")
    }
}
