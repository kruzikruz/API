//
//  DetailTable.swift
//  API
//
//  Created by Kornel Krużewski on 12/06/2023.
//

import SwiftUI
import Kingfisher


struct DetailTable: View {
    
    let table: Table
    var safeArea: EdgeInsets
    var size: CGSize
    @EnvironmentObject var eventsAPICall: EventsAPICall
    @EnvironmentObject var teamsAPICall: TeamsAPICall
    @EnvironmentObject var tableAPICall: TableAPICall
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ArtWork()
                
                GeometryReader { proxy in
                    let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                    
                    Color.clear
                        .frame(height: 50)
                        .padding(.top, -34)
                        .zIndex(1)
                }
                
                VStack {
                    VStack(alignment: .center, spacing: 14) {
                        HStack {
                            Text("Tabela")
                                .font(.custom("Poppins", size: 14))
                                .tracking(0.26)
                                .lineSpacing(24.53)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                // Akcja, która zostanie wykonana po kliknięciu przycisku
                            }) {
                                Text("Zobacz wszystko")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.82, green: 0.71, blue: 1))
                            }
                        }
                        .frame(width: 330, height: 31.5391)
                    }
                    .padding(.horizontal)
                    .padding(.top, 14.01759)
                    .padding(.bottom, 14.01715)
                    .frame(width: 380, alignment: .center)
                    .background(Color(red: 0.13, green: 0.13, blue: 0.2))
                    .cornerRadius(7.88478)
                    
                    VStack(alignment: .center, spacing: 14) {
                        HStack {
                            Text("Najlepsi strzelcy")
                                .font(.custom("Poppins", size: 13))
                                .kerning(0.23504)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                // Akcja, która zostanie wykonana po kliknięciu przycisku
                            }) {
                                Text("Zobacz wszystko")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.82, green: 0.71, blue: 1))
                            }
                        }
                        .frame(width: 330, height: 31.5391)
                        
                        HStack {
                            Text("Zawodnik")
                                .font(.custom("Poppins", size: 10))
                                .kerning(0.23504)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("Bramki")
                                .font(.custom("Poppins", size: 10))
                                .kerning(0.26283)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 330, height: 10)
                        
                        ForEach(0..<8) { index in
                            HStack {
                                Circle()
                                    .foregroundColor(.blue)
                                    .frame(width: 18, height: 18)
                                    .overlay(
                                        Image("Franki")
                                            .resizable()
                                            .scaledToFit()
                                    )
                                    .mask(Circle())
                                
                                Text("Roberto Firmino")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("3")
                                    .font(.custom("Poppins", size: 12).weight(.medium))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 330, height: 25)
                            
                            if index != 7 {
                                Divider()
                                    .background(Color.gray)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 14.01759)
                    .padding(.bottom, 14.01715)
                    .frame(width: 380, alignment: .center)
                    .background(Color(red: 0.13, green: 0.13, blue: 0.2))
                    .cornerRadius(7.88478)
                    
                    VStack(alignment: .center, spacing: 14) {
                        HStack {
                            Text("Najlepsi strzelcy")
                                .font(.custom("Poppins", size: 13))
                                .kerning(0.23504)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Button(action: {
                                // Akcja, która zostanie wykonana po kliknięciu przycisku
                            }) {
                                Text("Zobacz wszystko")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.82, green: 0.71, blue: 1))
                            }
                        }
                        .frame(width: 330, height: 31.5391)
                        
                        HStack {
                            Text("Zawodnik")
                                .font(.custom("Poppins", size: 10))
                                .kerning(0.23504)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("Bramki")
                                .font(.custom("Poppins", size: 10))
                                .kerning(0.26283)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                        .frame(width: 330, height: 10)
                        
                        ForEach(0..<8) { index in
                            HStack {
                                Circle()
                                    .foregroundColor(.blue)
                                    .frame(width: 18, height: 18)
                                    .overlay(
                                        Image("Franki")
                                            .resizable()
                                            .scaledToFit()
                                    )
                                    .mask(Circle())
                                
                                Text("Roberto Firmino")
                                    .font(.custom("Poppins", size: 12))
                                    .kerning(0.26283)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text("3")
                                    .font(.custom("Poppins", size: 12).weight(.medium))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 330, height: 25)
                            
                            if index != 7 {
                                Divider()
                                    .background(Color.gray)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 14.01759)
                    .padding(.bottom, 14.01715)
                    .frame(width: 380, alignment: .center)
                    .background(Color(red: 0.13, green: 0.13, blue: 0.2))
                    .cornerRadius(7.88478)
                    
                }
                .padding(.top, 10)
                .zIndex(0)
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
            
        }
        .preferredColorScheme(.dark)
        .coordinateSpace(name: "SCROLL")
        .onAppear {
            dump(table.data)
            }
    }
    
    @ViewBuilder
    func ArtWork() -> some View {
        let height = size.height * 0.45
        
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            Image("Artwork")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay(
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        .black.opacity(0 - progress),
                                        .black.opacity(0.1 - progress),
                                        .black.opacity(0.3 - progress),
                                        .black.opacity(0.5 - progress),
                                        .black.opacity(0.8 - progress),
                                        .black.opacity(1),
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        
                        VStack(spacing: 0) {
                            Image("AMP")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 140, height: 140)
                                .padding(.bottom, 60)
                            if let unwrappedTitle = table.title {
                                Text(unwrappedTitle.rendered)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                
                            } else {
                                // Obsłuż przypadek, gdy wartość jest nil
                                // Na przykład, możesz zamiast tego wyświetlić domyślny tekst
                                Text("Default Title")
                            }
                            Text("8 miejsce w lidze".uppercased())
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                                .padding(.top, 15)
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress))
                        .padding(.bottom, 10)
                        .offset(y: minY < 0 ? minY : 0)
                    }
                )
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
        .navigationBarBackButtonHidden(true)
        .onAppear {
                tableAPICall.getTable()
                teamsAPICall.getTeams()
            }
        //.ignoresSafeArea(.container, edges: .top)
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress = minY / height
            
            HStack(spacing: 15) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
            .overlay(
                Text("AMP")
                    .fontWeight(.semibold)
                    .offset(y: -titleProgress > 0.75 ? 0 : 45)
                    .clipped()
                    .animation(.easeInOut(duration: 0.25), value: -titleProgress > 0.75)
            )
            .padding(.top, safeArea.top + 45)
            .padding([.horizontal, .bottom], 15)
            .background(
                Color.black.opacity(-progress > 1 ? 1 : 0)
            )
            .offset(y: -minY)
        }
        .frame(height: 35)
        //.ignoresSafeArea(.container, edges: .top)
    }
    
}
        
struct DetailTable_Previews: PreviewProvider {
    static var previews: some View {
        DetailTable(table: Table.default, safeArea: .init(), size: .init())
            .environmentObject(EventsAPICall())
            .environmentObject(TeamsAPICall())
            .environmentObject(TableAPICall())
    }
}

