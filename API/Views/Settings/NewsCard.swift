//
//  NewsCard.swift
//  API
//
//  Created by Kornel Krużewski on 25/06/2023.
//

import SwiftUI



struct NewsCard: View {
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 358, height: 86)
              //.position(x:179, y:147)
              .background(
                LinearGradient(
                  stops: [
                    Gradient.Stop(color: .black.opacity(0), location: 0.00),
                    Gradient.Stop(color: .black, location: 0.72),
                  ],
                  startPoint: UnitPoint(x: 0.5, y: 0),
                  endPoint: UnitPoint(x: 0.5, y: 1)
                )
              )
              .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top, spacing: 0) {
                    Text(" Top news")
                      .font(
                        Font.custom("Manrope", size: 10)
                          .weight(.medium)
                      )
                      .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                }
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(.white.opacity(0.08))
                .cornerRadius(1)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("UDANY POCZĄTEK SEZONU")
                      .font(Font.custom("Bebas Neue", size: 28))
                      .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
                      .frame(maxWidth: .infinity, minHeight: 34, maxHeight: 34, alignment: .topLeading)
                    HStack(alignment: .top, spacing: 4) {
                        Text("Basketball")
                          .font(
                            Font.custom("Manrope", size: 12)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0, green: 0.4, blue: 0.04))
                        Text("·")
                          .font(
                            Font.custom("Manrope", size: 12)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                        Text("Wed 12/16 ")
                          .font(
                            Font.custom("Manrope", size: 12)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                        Text("·")
                          .font(
                            Font.custom("Manrope", size: 12)
                              .weight(.semibold)
                          )
                          .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                        Text("8:30 PM")
                          .font(
                            Font.custom("Manrope", size: 12)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
            
        }
        .padding(16)
        .frame(width: 358, height: 190, alignment: .bottom)
        .background(
        Image("dsc_5240_website-2-773x380")
        .resizable()
        )
        .cornerRadius(10)
    }
}

struct NewsCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsCard()
    }
}
