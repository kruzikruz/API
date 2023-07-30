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
        ZStack{
            Text("Bartosz Kwiatkowski")
              .font(Font.custom("SF Pro Text", size: 16))
              .foregroundColor(.white)
              .frame(width: 192, height: 55, alignment: .topLeading)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 390, height: 218)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(red: 0, green: 0.66, blue: 0.07), location: 0.00),
                            Gradient.Stop(color: Color(red: 0.92, green: 1, blue: 0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: -0.04, y: 0.5),
                        endPoint: UnitPoint(x: 1, y: 0.5)
                    )
                )
        }
    }
}

struct Players_Previews: PreviewProvider {
    static var previews: some View {
        Players()
            .environmentObject(EventsAPICall())
    }
}

