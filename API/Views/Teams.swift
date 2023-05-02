//
//  Teams.swift
//  API
//
//  Created by Kornel Krużewski on 01/05/2023.
//

import SwiftUI

struct TeamsView: View {
    @EnvironmentObject var teamsapicall: TeamsAPICall

    var body: some View {
        ScrollView {
            Text("Zespoły")
                .font(.title)
                .bold()

            VStack(alignment: .leading) {
                ForEach(teamsapicall.teams) { teams in
                    HStack(alignment:.top) {
                        VStack(alignment: .leading) {
                            Text(teams.link)
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
            teamsapicall.getTeams()
        }
    }
}

struct Teams_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
            .environmentObject(TeamsAPICall())
    }
}
