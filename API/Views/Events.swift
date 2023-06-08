import SwiftUI

struct NavigationBar2: View {
    var body: some View {
        VStack {
            HStack {
                Image("livescore")
                    .resizable()
                    .frame(width: 120, height: 20)
                Spacer()
                HStack(spacing: 16) {
                    Button {
                        // akcja
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .tint(.white)
                    .frame(width: 24, height: 24)
                    Button {
                        // akcja
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
                .overlay(Color.white)
        }
    }
}

struct EventsView: View {
    @EnvironmentObject var eventsAPICall: EventsAPICall
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationBar2()
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(eventsAPICall.events, id: \.id) { event in
                            NavigationLink(destination: DetailEvents(event: event)) {
                                ZStack(alignment: .bottom) {
                                    VStack(spacing: 0) {
                                        HStack(spacing: 0) {
                                            VStack {
                                                Text(event.day)
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 8))
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
                                                    Text("TEST")
                                                        .foregroundColor(.white)
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
                                                    Text("TEST")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 12, weight: .regular, design: .default))
                                                }
                                                .padding(.top, 6)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .clipped()
                                            }
                                            .frame(height: 60, alignment: .leading)
                                            .clipped()
                                            VStack {
                                                Text("0")
                                                    .foregroundColor(.white)
                                                    .padding(5)
                                                Text("0")
                                                    .foregroundColor(.white)
                                                    .padding(5)
                                            }
                                            .frame(height: 60, alignment: .center)
                                            .clipped()
                                        }
                                    }
                                    .padding(10)
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    eventsAPICall.getEvents()
                }
                }
            }
        }
    }




struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView().environmentObject(EventsAPICall())
    }
}
