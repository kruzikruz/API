//
//  Events.swift
//  API
//
//  Created by Kornel Krużewski on 02/05/2023.
//

import SwiftUI

struct NavigationBar2: View {
        
    var body: some View {
        VStack {
            HStack {
                Text("Mecze")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                HStack(
                    spacing: 16
                ) {
                    Button {
                        //action
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .tint(.white)
                    .frame(width: 24, height: 24)
                    Button {
                        //action
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                    .tint(.white)
                    .frame(width: 24, height: 24)
                }
            }
            .padding([.leading, .trailing], 12)
            Divider()
                .ignoresSafeArea()
                .overlay(.white)
        }
    }
}

struct EventsView: View {
    @EnvironmentObject var eventsapicall: EventsAPICall
    
    var body: some View {
        NavigationView{
          VStack {
            NavigationBar2()
            ScrollView(showsIndicators: false){
                VStack {
                    ForEach(eventsapicall.events, id: \.id) { events in NavigationLink(destination: DetailEvents(event: events)) {
                        ZStack(alignment: .bottom) {
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    VStack {
                                        Text(events.day)
                                    }
                                    .clipped()
                                    .padding(5)
                                    VStack(alignment: .trailing) {
                                        HStack(spacing: 4) {
                                            Image("myImage")
                                                .renderingMode(.original)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 20)
                                                .clipped()
                                            Text("\(events.teams[0])")
                                                .font(.system(size: 12, weight: .regular, design: .default))
                                        }
                                        .padding(.top, 6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .clipped()
                                        HStack(spacing: 4) {
                                            Image("myImage")
                                                .renderingMode(.original)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 20)
                                                .clipped()
                                            Text("\(events.teams[1])")
                                                .font(.system(size: 12, weight: .regular, design: .default))
                                        }
                                        .padding(.top, 6)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .clipped()
                                    }
                                    .frame(height: 60, alignment: .leading)
                                    .clipped()
                                    VStack {
                                        Text("1")
                                            .padding(5)
                                        Text("2")
                                            .padding(5)
                                    }
                                    .frame(height: 60, alignment: .center)
                                    .clipped()
                                }
                                
                            }
                            .padding(10)
                        }
                        //.frame()
                        //.clipped()
                    }
                    }
                    }
                }
                .onAppear {
                    eventsapicall.getEvents()}
            }
        }
    }
}

struct Events_Previews: PreviewProvider {
    static var previews: some View {
        EventsView().environmentObject(EventsAPICall())
    }
}
