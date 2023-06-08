//
//  DetailEvents.swift
//  API
//
//  Created by Kornel Krużewski on 02/05/2023.
//

import SwiftUI

struct DetailEvents: View {
    
    let event: Events
    @EnvironmentObject var eventsapicall: EventsAPICall
    
    
    var body: some View {
            Text(event.day)
                .font(.largeTitle)
        }
    
}
struct DetailEvents_Previews: PreviewProvider {
    static var previews: some View {
        DetailEvents(event: Events.default).environmentObject(EventsAPICall())
    }
}

