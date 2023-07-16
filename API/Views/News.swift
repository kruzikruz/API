//
//  News.swift
//  API
//
//  Created by Kornel Krużewski on 04/05/2023.
//
import SwiftUI
import Kingfisher

struct News: View {
    
    @StateObject var postsapicall = PostsAPICall()
    
    var body: some View {
        VStack{
            NavigationView{
                VStack {
                    NavBar()
                    ScrollView(showsIndicators: false){
                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(postsapicall.posts, id: \.id) { posts in // Replace with your data model here
                                        NavigationLink(destination: NewsDetail(post: posts)) {
                                            HStack{
                                                KFImage(URL(string: (posts.jetpack_featured_media_url )) ?? URL(string: EMPTY_IMAGE_URL)!)
                                                //.scaledToFill()
                                                //.renderingMode(.original)
                                                    .resizable()
                                                //.scaledToFill()
                                                    .frame(width: 200, height: 120)
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
                                                            Text(posts.title.rendered)
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
                                }
                            }
                            Image("STS")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                                .padding()
                            ScrollView{
                                VStack {
                                    VStack {
                                        ForEach(postsapicall.posts, id: \.id) { posts in // Replace with your data model here
                                            NavigationLink(destination: NewsDetail(post: posts)) {
                                                HStack {
                                                    KFImage(URL(string: (posts.jetpack_featured_media_url )) ?? URL(string: EMPTY_IMAGE_URL)!)
                                                        .resizable()
                                                    //.scaledToFill()
                                                        .frame(width: 150, height: 90)
                                                    //.scaledToFill()
                                                    //.cornerRadius(35)
                                                    VStack {
                                                        Text(posts.title.rendered)
                                                            .foregroundColor(.white)
                                                            .multilineTextAlignment(.leading)
                                                        HStack(alignment: .bottom) {
                                                            Text("Hello, World!")
                                                                .background {
                                                                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                                                                        .fill(Color(.systemFill))
                                                                }
                                                                .font(.system(size: 8, weight: .regular, design: .default))
                                                            Text(formatDate(posts.date))
                                                                .font(.system(size: 8, weight: .regular, design: .default))
                                                        }
                                                        .frame(maxWidth: .infinity, alignment: .bottom)
                                                        .clipped()
                                                    }
                                                }
                                            }
                                            .background(Color(red: 0.09, green: 0.09, blue: 0.09))
                                        }
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                    }
                                    .onAppear {
                                        postsapicall.getPosts()
                                    }
                                }
                            }
                        }
                    }
                }
                .background(
                    LinearGradient(
                        gradient: Gradient(
                            colors: [
                                Color(red: 30/255, green: 30/255, blue: 30/255),
                                Color(red: 46/255, green: 46/255, blue: 46/255)
                            ]
                        ),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .edgesIgnoringSafeArea(.all)
                )
                .navigationBarHidden(true)
            }
        }
    }
}


    struct News_Previews: PreviewProvider {
        static var previews: some View {
            News().environmentObject(PostsAPICall())
        }
    }

