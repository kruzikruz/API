//
//  CardTest.swift
//  API
//
//  Created by Kornel Krużewski on 09/07/2023.
//

import SwiftUI

struct CardTest: View {
  var body: some View {
      ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 358, height: 195)
              .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.56, green: 0, blue: 1), Color(red: 0.72, green: 0.36, blue: 1)]), startPoint: .leading, endPoint: .trailing)
              )
              .cornerRadius(12)
              .offset(x: 0, y: 0)
            Text("14 Days VIP Access")
              .font(Font.custom("Inter", size: 18).weight(.semibold))
              .lineSpacing(26)
              .foregroundColor(Color(red: 0.92, green: 0.92, blue: 0.92))
              .offset(x: -77.50, y: -68.50)
            Text("14 days live streaming all content")
              .font(Font.custom("Inter", size: 13))
              .lineSpacing(20)
              .foregroundColor(Color(red: 0.87, green: 0.87, blue: 0.87))
              .offset(x: -60.50, y: -42.50)
            Text("$29")
              .font(Font.custom("Inter", size: 36).weight(.semibold))
              .tracking(0.36)
              .lineSpacing(36)
              .foregroundColor(.white)
              .offset(x: -124, y: 0.50)
            HStack(spacing: 10) {
              Text("Activate")
                .font(Font.custom("Inter", size: 15).weight(.semibold))
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.60, green: 0.10, blue: 1))
            }
            .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
            .frame(width: 140, height: 36)
            .background(Color(red: 0.92, green: 0.92, blue: 0.92))
            .cornerRadius(20)
            .offset(x: -90, y: 59.50)
          }
          .frame(width: 358, height: 195);
  }
}

struct CardTest_Previews: PreviewProvider {
  static var previews: some View {
      CardTest()
  }
}
