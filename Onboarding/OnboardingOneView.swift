//
//  OnboardingOneView.swift
//  API
//
//  Created by Kornel Krużewski on 16/06/2023.
//

import SwiftUI
import ACarousel

public struct ContentViewTEST: View {
    @State private var selection = 2 // Ustawienie indeksu początkowego na trzeci slajd
    
    public var body: some View {
        GeometryReader { geometry in
            TabView(selection: $selection) {
                ForEach(0..<5) { index in
                    HStack(alignment: .center) {
                        HStack(alignment: .center) {
                            VStack(alignment: .center) {
                                Image("AMP")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                Text("Nogat Malbork")
                                    .font(
                                        Font.custom("Poppins", size: 7)
                                            .weight(.medium)
                                    )
                                    .kerning(0.26283)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                HStack(spacing: 5) {
                                    ForEach(0..<5) { index in
                                        Circle()
                                            .fill(.blue)
                                            .frame(width: 10, height: 10)
                                    }
                                }
                            }
                            .frame(width: 80)
                            .padding()
                            VStack(alignment: .center, spacing: 20) {
                                Text("20:00")
                                    .font(
                                        Font.custom("Poppins", size: 24)
                                            .weight(.medium)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                Text("29 LIP")
                                    .font(
                                        Font.custom("Poppins", size: 7)
                                            .weight(.medium)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 100) // Ustawienie alignment na .center oraz szerokości na 100

                            VStack(alignment: .center) {
                                Image("AMP")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                Text("Amatorka Mikołajki Pomorskie")
                                    .font(
                                        Font.custom("Poppins", size: 7)
                                            .weight(.medium)
                                    )
                                    .kerning(0.26283)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                //.lineLimit(nil)
                                HStack(spacing: 5) {
                                    ForEach(0..<5) { index in
                                        Circle()
                                            .fill(.blue)
                                            .frame(width: 10, height: 10)
                                    }
                                }
                            }
                            .frame(width: 80)
                            .padding()
                        }
                        .frame(width: 330, height: 100)
                        .padding(10)
                        .background(Color(red: 0.13, green: 0.13, blue: 0.2))
                        .cornerRadius(15)
                    }
                    .tag(index) // Ustawienie tagu dla każdego slajdu
                    .padding(.horizontal, 20) // Dodanie dodatkowego paddingu poziomego dla efektu przesuwania slajdów
                }
            }
            .tabViewStyle(PageTabViewStyle()) // Ustawienie stylu TabView na pokaz slajdów
            //.padding(.horizontal, -10) // Usunięcie paddingu poziomego, aby zawartość była wyśrodkowana
            .frame(width: geometry.size.width) // Ustawienie szerokości TabView na szerokość ekranu
        }
    }
}

struct ContentViewTEST_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTEST()
    }
}
