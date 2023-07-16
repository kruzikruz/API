//
//  NavBar.swift
//  API
//
//  Created by Kornel Krużewski on 09/07/2023.
//

import SwiftUI
import Kingfisher

struct NavBar: View {
  var body: some View {
      ZStack {
          HStack {
              Spacer()
              KFImage(URL(string: "https://amatorkamp.pl/wp-content/uploads/2022/03/logo@2x-260x300.png"))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
                Spacer()
          }
          .padding([.leading, .trailing], 30)
          .padding([.bottom], 5)
      }
      .background(
                  LinearGradient(gradient: Gradient(colors: [Color(red: 1/255, green: 47/255, blue: 24/255), Color(red: 1/255, green: 128/255, blue: 61/255)]), startPoint: .leading, endPoint: .trailing)
              )
  }
}

struct NavBar_Previews: PreviewProvider {
  static var previews: some View {
      NavBar()
  }
}

