//
//  TestViewModel.swift
//  MovieAppTests
//
//  Created by Roberto De la O Pocasangre on 14/11/23.
//

import XCTest
import Foundation
import Combine
import Moya
@testable import MovieApp

class TestViewModel: XCTestCase {
    private var cancellables: Set<AnyCancellable> = []
    
    func testViewModelSuccess() {
        var isSuccess = false
        
        let mockNetworkingDependencies = MockNetworkingManagerDependencies(mockRequester: .init(requesterState: .success))
        
        let movieService = MovieService(
            dependencies: MockMovieServiceDependencies(
                networkManager: MockNetworkingManagerDependencies(
                    mockRequester: .init(requesterState: .success)
                )
                .networkManager)
        )
        
        let expecation = XCTestExpectation(description: "Mus get popular list")
        movieService
            .popularList()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    
                    expecation.fulfill()
                case .failure:
                    expecation.fulfill()
                }
            } receiveValue: { _ in
                isSuccess = true
            }.store(in: &cancellables)
        
        wait(for: [expecation], timeout: 4.0)
        XCTAssertTrue(isSuccess)
    }
}
