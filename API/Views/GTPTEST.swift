//
//  GTPTEST.swift
//  API
//
//  Created by Kornel Krużewski on 03/05/2023.
//

import SwiftUI

struct SportsLiveActivity: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("myImage")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 390)
                .clipped()
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    VStack(spacing: 4) {
                        Image("myImage")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 40)
                            .clipped()
                        HStack(spacing: 2) {
                            Text("Timberwolves")
                                .font(.system(.caption2, weight: .medium))
                        }
                    }
                    .padding(.top, 6)
                    .frame(width: 86)
                    .clipped()
                    Text("1")
                        .font(.largeTitle)
                        .fixedSize(horizontal: true, vertical: false)
                    VStack {
                        HStack(spacing: 4) {
                            Text(":")
                        }

                    }
                    .font(.system(.caption, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .clipped()
                    Text("0")
                        .font(.largeTitle)
                        .fixedSize(horizontal: true, vertical: false)
                    VStack(spacing: 4) {
                        Image("myImage")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 38)
                            .clipped()
                            .frame(width: 60, height: 40)
                            .clipped()
                        HStack(spacing: 2) {
                            Text("Grizzlies")
                                .font(.system(.caption2, weight: .medium))
                        }
                    }
                    .frame(width: 86)
                    .clipped()
                    .padding(.top, 6)
                }
                .padding(.horizontal, 10)
                .padding(.top, 10)
                .padding(.bottom, 10)
                .background(Color(.systemBackground))
                HStack {
                    Image("myImage")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 21)
                        .clipped()
                        .frame(width: 70)
                        .clipped()
                    VStack {
                        Text("Western Conference Round 1")
                            .font(.system(.footnote, weight: .medium))
                        Text("Game 5: Series Tied 2-2")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                    }
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    Image("myImage")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32)
                        .clipped()
                        .frame(width: 70)
                        .clipped()
                }
                .padding(.horizontal)
                .padding(.vertical, 12)
                .background(Color(.secondarySystemBackground))
            }
            .mask {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
            }
            .padding(10)
            .padding(.bottom, 100)
        }
        //.frame()
        .clipped()
    }
}

struct SportsLiveActivity_Previews: PreviewProvider {
    static var previews: some View {
        SportsLiveActivity()
    }
}
