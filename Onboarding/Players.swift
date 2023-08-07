//
//  Players.swift
//  API
//
//  Created by Kornel Krużewski on 30/07/2023.
//

import SwiftUI
import ACarousel
import IrregularGradient


struct Players: View {
    @EnvironmentObject var eventsAPICall: EventsAPICall
    
    public var body: some View {
        VStack(alignment: .center, spacing: 14) {
            HStack {
                Text("Tabela")
                    .font(.custom("Poppins", size: 13))
                    .kerning(0.23504)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    // Akcja, która zostanie wykonana po kliknięciu przycisku
                }) {
                    Text("Zobacz całą tabele")
                        .font(.custom("Poppins", size: 12))
                        .kerning(0.26283)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.82, green: 0.71, blue: 1))
                }
            }
            .frame(width: 310, height: 31.5391)
            HStack {
                Text("Drużyna")
                    .font(.custom("Poppins", size: 10))
                    .kerning(0.23504)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                Spacer()
                Text("M")
                    .font(.custom("Poppins", size: 10))
                    .kerning(0.26283)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("Z")
                    .font(.custom("Poppins", size: 10))
                    .kerning(0.26283)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("R")
                    .font(.custom("Poppins", size: 10))
                    .kerning(0.26283)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("P")
                    .font(.custom("Poppins", size: 10))
                    .kerning(0.26283)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("RB")
                    .font(.custom("Poppins", size: 10))
                    .kerning(0.26283)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("Pkt")
                    .font(.custom("Poppins", size: 10))
                    .kerning(0.26283)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 20)
            }
            .frame(width: 310, height: 10)
            
            HStack {
                Text("1")
                    .font(.custom("Poppins", size: 12).weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 12)
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 18, height: 18)
                    .overlay(
                        Image("AMP")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                            .mask(Circle())
                    )
                    .mask(Circle())
                
                Text("Amatorka Mikołajki Pomorskie")
                    .font(.custom("Poppins", size: 12))
                    .kerning(0.26283)
                    .foregroundColor(.white)
                
                Spacer()
                Text("3")
                    .font(.custom("Poppins", size: 12).weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("3")
                    .font(.custom("Poppins", size: 12).weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("3")
                    .font(.custom("Poppins", size: 12).weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("3")
                    .font(.custom("Poppins", size: 12).weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("3")
                    .font(.custom("Poppins", size: 12).weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 15)
                Text("3")
                    .font(.custom("Poppins", size: 12).weight(.medium))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 20)
            }
            .frame(width: 310, height: 25)
            
        }
        .padding(.horizontal)
        .padding(.top, 14.01759)
        .padding(.bottom, 14.01715)
        .frame(width: 350, alignment: .center)
        .background(Color(red: 0.13, green: 0.13, blue: 0.2))
        .cornerRadius(7.88478)
    }
}
struct Players_Previews: PreviewProvider {
    static var previews: some View {
        Players()
            .environmentObject(EventsAPICall())
    }
}

