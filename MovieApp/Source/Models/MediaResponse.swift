//
//  MediaResponse.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 14/11/23.
//

import Foundation

struct MediaResponse<T: Decodable>: Decodable {
    let page: Int
    let results: [T]
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
    }
}
