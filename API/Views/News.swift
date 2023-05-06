//
//  News.swift
//  API
//
//  Created by Kornel Krużewski on 04/05/2023.
//

import SwiftUI
import UIKit.UIImage





struct News: View {
    
    @EnvironmentObject var postsapicall: PostsAPICall
    
    var body: some View {
        ScrollView{
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<5) { _ in // Replace with your data model here
                            Image("myImage")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 320, maxHeight: 129)
                                .clipped()
                                .mask { RoundedRectangle(cornerRadius: 0, style: .continuous) }
                                .overlay {
                                    VStack(alignment: .leading) {
                                        Text("I DRUŻYNA")
                                            .padding(9)
                                            .background {
                                                RoundedRectangle(cornerRadius: 9, style: .continuous)
                                                    .fill(.black)
                                            }
                                            .foregroundColor(.white)
                                            .font(.system(size: 8, weight: .regular, design: .default))
                                        Text("TRZY PUNKTY Z TERENU WICELIDERA  ")
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .font(.caption)
                                        Text("5 LISTOPADA 2022 ")
                                            .padding(9)
                                            .foregroundColor(.white)
                                            .font(.system(size: 6, weight: .regular, design: .default))
                                    }
                                    .padding(1)
                                    .frame(maxWidth: .infinity)
                                    .clipped()
                                }
                        }
                    }
                }
                Image("STS")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding()
                ScrollView{
                    NavigationView {
                        VStack {
                            ForEach(postsapicall.posts, id: \.id) { posts in // Replace with your data model here
                                NavigationLink(destination: NewsDetail(name: posts.title.rendered)) {
                                    HStack {
                                        Image("myImage")
                                            .renderingMode(.original)
                                            .resizable()
                                            .frame(width: 160, height: 80)
                                            .aspectRatio(contentMode: .fit)
                                            .clipped();
                                        VStack {
                                            Text(posts.title.rendered)
                                                .foregroundColor(.white)
                                            HStack(alignment: .bottom) {
                                                Text("Hello, World!")
                                                    .background {
                                                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                                                            .fill(Color(.systemFill))
                                                    }
                                                    .font(.system(size: 8, weight: .regular, design: .default))
                                                Text(posts.date)
                                                    .font(.system(size: 8, weight: .regular, design: .default))
                                            }
                                            .frame(maxWidth: .infinity, alignment: .bottom)
                                            .clipped()
                                        }
                                    }
                                }
                            }
                        }
                        .onAppear {
                            postsapicall.getPosts()
                        }
                    }
                }
               }
              }
             }
            }
        
    struct News_Previews: PreviewProvider {
        static var previews: some View {
            News().environmentObject(PostsAPICall())
        }
    }

