//
//  OnboardingOneView.swift
//  API
//
//  Created by Kornel Krużewski on 16/06/2023.
//

import SwiftUI
import ACarousel
import IrregularGradient


struct ContentViewTEST2: View {
    @EnvironmentObject var eventsAPICall: EventsAPICall
    
    public var body: some View {
        RoundedRectangle(cornerRadius: 0.0, style: .continuous)
            .irregularGradient(colors: [.white, .yellow, .green], backgroundColor: .green)
    }
}

struct ContentViewTEST2_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTEST2()
            .environmentObject(EventsAPICall())
    }
}
