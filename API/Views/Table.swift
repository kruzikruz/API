//
//  Table.swift
//  API
//
//  Created by Kornel Krużewski on 18/05/2023.
//

import SwiftUI

struct TableView: View {
    
    @EnvironmentObject var tableapicall: TableAPICall
    
    var body: some View {

        HStack(spacing: 10) {
            Text("Amatorka Mikołajki Pomorskie")
                .frame(width: 170.0, alignment: .leading)
            Spacer()
                .frame(width: 20.0)
            Text("21")
                .frame(width: 15) // replace 12 with any value for the exact result you're expecting
            Divider()
            Text("32")
                .frame(width: 15) // doesn't have to match the above Text's width either could be any value and would still work
            Divider()
            Text("9")
                .frame(width: 10)
            Divider()
            Text("5")
                .frame(width: 10)
            Divider()
            
        }
        .onAppear {
            tableapicall.getTable()}
    }
    
}

struct Table_Previews: PreviewProvider {
    static var previews: some View {
        TableView().environmentObject(TableAPICall())
    }
}
