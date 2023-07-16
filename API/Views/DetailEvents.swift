//
//  DetailEvents.swift
//  API
//
//  Created by Kornel Krużewski on 02/05/2023.
//

import SwiftUI
import Kingfisher

struct DetailEvents: View {
    
    let event: Events
    
   
    
    
    
    @EnvironmentObject var eventsAPICall: EventsAPICall
    @EnvironmentObject var teamsAPICall: TeamsAPICall
    
    
    var body: some View {
        VStack{
            NavigationView {
                VStack {
                    NavBar()
                    ScrollView(showsIndicators: false) {
                        VStack {
                            Text("TEST")
                        }
                    }
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
}


struct DetailEvents_Previews: PreviewProvider {
    static var previews: some View {
        DetailEvents(event: Events.default)
            .environmentObject(EventsAPICall())
            .environmentObject(TeamsAPICall())
    }
}
