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
        ScrollView {
            Text("Mecze")
                .font(.title)
                .bold()

            VStack(alignment: .leading) {
                ForEach(eventsapicall.events) { events in
                    HStack(alignment:.top) {
                        VStack(alignment: .leading) {
                            Text(events.day)
                            Text(events.title.rendered)
                        }
                    }
                    .frame(width: 350, alignment: .leading)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                    .cornerRadius(0)
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
