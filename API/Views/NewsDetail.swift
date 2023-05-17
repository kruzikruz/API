//
//  NewsDetail.swift
//  API
//
//  Created by Kornel Krużewski on 06/05/2023.
//

import SwiftUI
import Kingfisher


struct NewsDetail: View {
    let post: Posts
    @State private var userData: UserData?
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var postsapicall: PostsAPICall
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
        NavigationView {
                VStack{
                    VStack {
                        Text(post.title.rendered)
                            .multilineTextAlignment(.leading)
                            .padding(5)
                    }
                    .padding(.leading, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .clipped()
                    HStack {
                        KFImage(URL(string: (post.jetpack_featured_media_url )) ?? URL(string: EMPTY_IMAGE_URL)!)
                        //.scaledToFill()
                        //.renderingMode(.original)
                            .resizable()
                        //.scaledToFill()
                            .frame(width: 20, height: 20)
                        VStack {
                            Text(userData?.name ?? "TEST")
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
                    KFImage(URL(string: (post.jetpack_featured_media_url )) ?? URL(string: EMPTY_IMAGE_URL)!)
                    //.scaledToFill()
                    //.renderingMode(.original)
                        .resizable()
                    //.scaledToFill()
                        .frame(height: 200)
                    Text(post.content.rendered)
                }
            }.navigationBarTitle("News", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
            
                .toolbar {
                    
                    // 2
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            // 3
                            dismiss()
                        } label: {
                            // 4
                            HStack {
                                
                                Image(systemName: "chevron.backward")
                                    .foregroundColor(Color(.systemOrange))
                            }
                        }
                    }
                }
            
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
            guard let url = URL(string: "https://www.amatorkamp.pl/wp-json/wp/v2/users/1") else {
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(UserData.self, from: data)
                    DispatchQueue.main.async {
                        self.userData = user
                    }
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                }
            }.resume()
        }
    }




struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail(post: Posts.default).environmentObject(PostsAPICall())
    }
}



