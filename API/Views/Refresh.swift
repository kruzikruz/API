//
//  Refresh.swift
//  API
//
//  Created by Kornel Krużewski on 12/06/2023.
//

import SwiftUI

struct Refresh: View {
    @ObservedObject var tableAPI = TableAPICall()
    
    var body: some View {
        ZStack{
            VStack{
                Text("Refresh")
                Text("coming soon")
            }
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color(red: 30/255, green: 30/255, blue: 30/255),
                            Color(red: 46/255, green: 46/255, blue: 46/255)
                        ]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarHidden(true)
        }
        
        
    }
    
}

struct Refresh_Previews: PreviewProvider {
    static var previews: some View {
        Refresh().environmentObject(TableAPICall())
    }
}
