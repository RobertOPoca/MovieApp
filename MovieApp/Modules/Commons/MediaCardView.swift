//
//  MediaCardView.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 16/11/23.
//

import SwiftUI

struct MediaCardView: View {
    let media: Media
    var body: some View {
        GeometryReader { geometry in
            VStack {
                AsyncImage(url: URL(string: media.fullPosterPath)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.1)
                }.frame(height: geometry.size.height * 0.7)

                VStack(alignment: .leading) {
                    Text(media.title)
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.bold)

                    Text(media.overview)
                        .foregroundStyle(.white)
                        .font(.footnote)
                }
                .padding(.horizontal, 5)
                .frame(width: geometry.size.width)
            }
        }
        .background(Color(R.color.blackCoral).opacity(0.5))
        .cornerRadius(8)
    }
}

#Preview {
    MediaCardView(
        media: .init(id: 0,
                     title: "Sound of Freedom",
                     posterPath: "",
                     overview: "")
    )
}
