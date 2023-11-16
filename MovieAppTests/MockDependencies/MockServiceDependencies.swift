//
//  MockServiceDependencies.swift
//  MovieAppTests
//
//  Created by Roberto De la O Pocasangre on 15/11/23.
//

import Foundation
@testable import MovieApp

struct MockMovieServiceDependencies: MovieService.Dependencies {
    let networkManager: NetworkManagerType
    init(networkManager: NetworkManagerType) {
        self.networkManager = networkManager
    }
}
