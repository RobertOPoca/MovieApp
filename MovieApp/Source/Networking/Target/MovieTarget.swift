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
}

extension MovieTarget: AppTargetType {
    var appPath: String {
        switch self {
        case .popularList:
            return "/movie/now_playing"
        }
    }
    
    var appMethod: HttpMethod {
        switch self {
        case .popularList:
            return .get
        }
    }
    
    var appTask: Task {
        return .requestParameters(parameters: apiKey,
                                  encoding: URLEncoding.default)
    }
}
