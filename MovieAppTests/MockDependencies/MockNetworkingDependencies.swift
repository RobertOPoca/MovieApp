//
//  NetworkingDependencies.swift
//  MovieAppTests
//
//  Created by Roberto De la O Pocasangre on 14/11/23.
//

import Foundation
import Combine
import Moya
@testable import MovieApp

enum RequesterState {
    case success
    case failed(error: Error)
}

struct MockRequester: RequesterType {
    let requesterState: RequesterState
    func perform(target: AppTargetType) -> AnyPublisher<Data, Error> {
        Future { future in
            switch requesterState {
            case .success:
                if let movieTarget  = target as? MovieTarget {
                    future(.success(movieTarget.mockData))
                }
                
            default: break
                
            }
        }.eraseToAnyPublisher()
    }
}

struct MockRequesterDependencies: HasRequesterType {
    let requester: RequesterType
    init(requesterState: RequesterState) {
        self.requester = MockRequester(requesterState: requesterState)
    }
}

struct MockNetworkingManagerDependencies: HasNetworkManagerType {
    let networkManager: NetworkManagerType
    init(mockRequester: MockRequesterDependencies) {
        self.networkManager = NetworkManager(dependencies: mockRequester)
    }
}
