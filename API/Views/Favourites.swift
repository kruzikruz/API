//
//  Favourites.swift
//  API
//
//  Created by Kornel Krużewski on 12/06/2023.
//

import SwiftUI

struct Favourites: View {
    @ObservedObject var tableAPI = TableAPICall()
    
    var body: some View {
        VStack{
            Text("Favourites")
            Text("coming soon")
        }
    }
}

struct Favourites_Previews: PreviewProvider {
    static var previews: some View {
        Favourites().environmentObject(TableAPICall())
    }
}
