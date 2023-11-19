//
//  Media.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 14/11/23.
//

import Foundation

struct Media: Decodable, Hashable, Identifiable {
    let id: Int
    let title: String
    let posterPath: String
    let overview: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case overview
    }

    var fullPosterPath: String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
}
