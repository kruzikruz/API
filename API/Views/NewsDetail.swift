//
//  NewsDetail.swift
//  API
//
//  Created by Kornel Krużewski on 06/05/2023.
//

import SwiftUI

struct NewsDetail: View {

@EnvironmentObject var postsapicall: PostsAPICall
let name: String
    
var body: some View {
        VStack {
            VStack {
                Text(name)
                    .multilineTextAlignment(.leading)
                    .padding(5)
            }
            .padding(.leading, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .clipped()
            HStack {
                Image("myImage")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack {
                    Text("Kornel Krużewski")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        .font(.system(size: 12, weight: .regular, design: .default))
                    Text("Redaktor")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .clipped()
                        .font(.system(size: 8, weight: .regular, design: .default))
                }
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                .clipped()
                VStack {
                    Text("DATA")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .clipped()
                        .font(.system(size: 12, weight: .heavy, design: .default))
                    Text("11:30")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .clipped()
                        .font(.system(size: 8, weight: .heavy, design: .default))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .clipped()
                .multilineTextAlignment(.trailing)
            }
            .frame(maxWidth: .infinity, maxHeight: 35, alignment: .leading)
            .clipped()
            .padding()
            .multilineTextAlignment(.leading)
            Image("myImage")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail( name: "TEST").environmentObject(PostsAPICall())
    }
}
