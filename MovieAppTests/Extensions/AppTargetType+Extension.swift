//
//  AppTargetType+Extension.swift
//  MovieAppTests
//
//  Created by Roberto De la O Pocasangre on 14/11/23.
//

import Foundation
import Moya
@testable import MovieApp

extension TargetType {
    var mockData: Data {
        return Data()
    }
}

extension MovieTarget {
    var mockData: Data {
        switch self {
        case .popularList: JsonParser.parseJsonFile(name: "MoviePopularList")
        }
    }
}
