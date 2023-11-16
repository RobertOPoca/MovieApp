//
//  NetworkingManager.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 13/11/23.
//

import Combine
import Foundation
import Moya

protocol NetworkManagerType {
    func perform(request: AppTargetType) -> AnyPublisher<Data, Error>
}

extension NetworkManagerType {
    func perform<T>(request: AppTargetType,
                    using decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, Error> where T: Decodable {
        perform(request: request)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}

protocol HasNetworkManagerType {
    var networkManager: NetworkManagerType { get }
}

struct NetworkManager: NetworkManagerType {
    typealias Dependencies = HasRequesterType
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func perform(request: AppTargetType) -> AnyPublisher<Data, Error> {
        dependencies
            .requester
            .perform(target: request)
            .eraseToAnyPublisher()
    }
}

struct NetworkingManagerDependencies: NetworkManager.Dependencies {
    let requester: RequesterType = MoyaRequester(provider: MoyaProvider())
}
