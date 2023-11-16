//
//  TargetType.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 13/11/23.
//

import Foundation
import Moya

enum HttpMethod: String {
    case get = "GET"
}

protocol AppTargetType: TargetType {
    var baseURL: URL { get }
    var headers: [String: String]? { get }
    var appMethod: HttpMethod { get }
    var appPath: String { get }
    var appTask: Task { get }
}

extension AppTargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3")!
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
    
    var method: Moya.Method {
        switch appMethod {
        case .get:
            return .get
        }
    }
    
    var path: String {
        appPath
    }
    
    var task: Moya.Task {
        appTask
    }
    
    var apiKey: [String: Any] {
        ["api_key": "065c221838af7a64d06d5c07a7e63001"]
    }
}
