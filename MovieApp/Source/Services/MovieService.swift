//
//  MovieService.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 14/11/23.
//

import Combine
import Foundation

protocol MovieServiceType {
    func popularList() -> AnyPublisher<MediaResponse<Media>, Error>
}

struct MovieService: MovieServiceType {
    typealias Dependencies = HasNetworkManagerType
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func popularList() -> AnyPublisher<MediaResponse<Media>, Error> {
        dependencies
            .networkManager
            .perform(request: MovieTarget.popularList)
            .eraseToAnyPublisher()
    }
}

struct MovieServiceDependencies: MovieService.Dependencies {
    let networkManager: NetworkManagerType = NetworkManager(
        dependencies: NetworkingManagerDependencies()
    )
}
