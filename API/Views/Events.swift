//
//  Events.swift
//  API
//
//  Created by Kornel Krużewski on 02/05/2023.
//

import SwiftUI

struct EventsView: View {
    @EnvironmentObject var eventsapicall: EventsAPICall
    
    var body: some View {
        
        NavigationStack {
            List(eventsapicall.events, id: \.id) { events in
                NavigationLink(events.title.rendered){
                    DetailEvents(name: events.title.rendered)
                }
            }
        }
        .padding(.vertical)
        .onAppear {
            eventsapicall.getEvents()
        }
    }
}





struct Events_Previews: PreviewProvider {
    static var previews: some View {
        EventsView().environmentObject(EventsAPICall())
    }
}
