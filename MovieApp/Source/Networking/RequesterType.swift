//
//  RequesterType.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 13/11/23.
//

import Combine
import Foundation
import Moya

protocol RequesterType {
    func perform(target: AppTargetType) -> AnyPublisher<Data, Error>
}

protocol HasRequesterType {
    var requester: RequesterType { get }
}

struct MoyaRequester: RequesterType {
    private let provider: MoyaProvider<MultiTarget>
    
    init(provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }
    
    func perform(target: AppTargetType) -> AnyPublisher<Data, Error> {
        Future { future in
            provider
                .request(MultiTarget(target)) { result in
                    switch result {
                    case .success(let response):
                        future(.success(response.data))
                    case .failure(let error):
                        future(.failure(error))
                    }
                }
        }.eraseToAnyPublisher()
    }
}
