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
                            .frame(width: 330, height: 31.5391)
                            .padding(.top, 10)
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
                            .frame(width: 330, height: 10)
                            VStack{
                                ForEach(tableAPICall.table.filter { $0.id == 6514 }, id: \.id)  { table in
                                    
                                    let sortedData = table.data.sorted { (entry1, entry2) in
                                        if let pos1 = convertToInteger(entry1.value.pos), let pos2 = convertToInteger(entry2.value.pos) {
                                            return pos1 < pos2
                                        } else {
                                            return entry1.value.pos < entry2.value.pos
                                        }
                                    }
                                    
                                    ForEach(sortedData.filter { $0.value.pos != "Pozycja" }, id: \.key) { datum in
                                        NavigationLink(
                                            destination: DetailTable(
                                                table: table,
                                                safeArea: safeArea,
                                                size: size,
                                                selectedRowID: datum.key,
                                                selectedDatum: datum.value
                                            ).ignoresSafeArea(.container, edges: .top)
                                        ) {
                                            Text(datum.value.pos)
                                                .font(.custom("Poppins", size: 12).weight(.medium))
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .frame(width: 14)
                                            HStack { // Utworzono VStack, aby zawrzeć obrazek i tekst w jednej kolumnie
                                                if let teamIDString = datum.key,
                                                   let teamID = Int(teamIDString),
                                                   let imageURL = teamsAPICall.getTeamImageURL(for: teamID) {
                                                    KFImage(URL(string: imageURL))
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 18, height: 18)
                                                } else {
                                                    Image("myImage")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 18, height: 18)
                                                }
                                            }
                                            Text(datum.value.name)
                                                .font(.custom("Poppins", size: 12))
                                                .kerning(0.26283)
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            Text(datum.value.p)
                                                .font(.custom("Poppins", size: 12).weight(.medium))
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .frame(width: 15)
                                            Text(datum.value.gd)
                                                .font(.custom("Poppins", size: 12).weight(.medium))
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .frame(width: 15)
                                            Text(datum.value.pts)
                                                .font(.custom("Poppins", size: 12).weight(.medium))
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.white)
                                                .frame(width: 20)
                                        }
                                        .frame(width: 330, height: 25)
                                    }
                                }
                            }
                            .padding(.bottom,10)
                        }
                        .frame(width: 370, alignment: .center)
                        .background(Color(red: 18/255, green: 19/255, blue: 32/255))
                        .cornerRadius(10)
                        //.padding(.vertical, 100)
                    }
                    //.navigationBarTitle("Tabela")
                    .onAppear {
                        tableAPICall.getTable()
                        teamsAPICall.getTeams()
                    }
                    .background(Color(red: 24/255, green: 25/255, blue: 40/255))
                }
                .background(Color(red: 24/255, green: 25/255, blue: 40/255))
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
