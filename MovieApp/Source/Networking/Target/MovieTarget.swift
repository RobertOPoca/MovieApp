//
//  MovieTarget.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 13/11/23.
//

import Foundation
import Moya

enum MovieTarget {
    case popularList
    case playingList
    case topRatedList
    case upcomingList
}

extension MovieTarget: AppTargetType {
    var appPath: String {
        switch self {
        case .popularList:
            return "/movie/popular"
        case .playingList:
            return "/movie/now_playing"
        case .topRatedList:
            return "/movie/top_rated"
        case .upcomingList:
            return "/movie/upcoming"
        }
    }
    
    var appMethod: HttpMethod {
        switch self {
        case .popularList:
            return .get
        case .playingList:
            return .get
        case .topRatedList:
            return .get
        case .upcomingList:
            return .get
        }
    }
    
    var appTask: Task {
        return .requestParameters(parameters: apiKey,
                                  encoding: URLEncoding.default)
    }
}
