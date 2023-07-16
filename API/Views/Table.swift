//
//  Table.swift
//  API
//
//  Created by Kornel Krużewski on 18/05/2023.
//

import SwiftUI
import Kingfisher

struct TableView: View {
    @EnvironmentObject var tableAPICall: TableAPICall
    @EnvironmentObject var teamsAPICall: TeamsAPICall
    
    var body: some View {
        GeometryReader { geometry in
            let safeArea = geometry.safeAreaInsets
            let size = geometry.size
            NavigationView {
                VStack {
                    NavBar()
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 10) {
                            ForEach(tableAPICall.table.filter { $0.id == 6514 }, id: \.id)  { table in
                                VStack(spacing: 10) {
                                    HStack {
                                        TableCellView(text: "#", width: 50)
                                            .font(.headline)
                                        TableCellView(text: "Drużyna", width: 200) // Zwiększono szerokość kolumny "Drużyna"
                                            .font(.headline)
                                        TableCellView(text: "RB", width: 50)
                                            .font(.headline)
                                        TableCellView(text: "Pkt", width: 50)
                                            .font(.headline)
                                    }
                                    .padding()
                                    .background(Color.green)
                                    
                                    let sortedData = table.data.sorted { (entry1, entry2) in
                                        if let pos1 = convertToInteger(entry1.value.pos), let pos2 = convertToInteger(entry2.value.pos) {
                                            return pos1 < pos2
                                        } else {
                                            return entry1.value.pos < entry2.value.pos
                                        }
                                    }
                                    
                                    ForEach(sortedData.filter { $0.value.pos != "Pozycja" }, id: \.key) { datum in
                                        NavigationLink(destination: DetailTable(table: Table.default, safeArea: safeArea, size: size)
                                            .ignoresSafeArea(.container, edges: .top)) {
                                            HStack {
                                                TableCellView(text: datum.value.pos, width: 50)
                                                HStack { // Utworzono VStack, aby zawrzeć obrazek i tekst w jednej kolumnie
                                                    if let teamIDString = datum.key,
                                                       let teamID = Int(teamIDString),
                                                       let imageURL = teamsAPICall.getTeamImageURL(for: teamID) {
                                                        KFImage(URL(string: imageURL))
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 25, height: 25)
                                                    } else {
                                                        Image("myImage")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 25, height: 25)
                                                    }
                                                    TableCellView(text: datum.value.name, width: 150)
                                                }
                                                TableCellView(text: datum.value.gd, width: 50)
                                                TableCellView(text: datum.value.pts, width: 50)
                                            }
                                            .padding()
                                            .background(Color(red: 0.09, green: 0.09, blue: 0.09))
                                            .cornerRadius(8)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .background(Color.black)
                    }
                    //.navigationBarTitle("Tabela")
                    .onAppear {
                        tableAPICall.getTable()
                        teamsAPICall.getTeams()
                    }
                    .background(Color.black) // Dodanie czarnego tła dla całego widoku
                }
                .background(Color.black) // Dodanie czarnego tła dla całego widoku NavigationView
            }
            //.ignoresSafeArea(.container, edges: .top)
        }
    }
}

func convertToInteger(_ pos: String) -> Int? {
    if let intValue = Int(pos) {
        return intValue
    } else {
        return nil
    }
}

struct TableCellView: View {
    let text: String
    let width: CGFloat
    
    var body: some View {
        Text(text)
            .font(.custom("Source Sans Pro", size: 14))
            .foregroundColor(.white)
            .frame(width: width, alignment: .leading)
            .lineLimit(1)
    }
}

struct Table_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
            .environmentObject(TableAPICall())
            .environmentObject(TeamsAPICall())
    }
}
