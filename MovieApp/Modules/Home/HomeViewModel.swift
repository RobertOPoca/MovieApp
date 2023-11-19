//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 16/11/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    typealias Dependencies = HasMovieServiceType

    @Published var popularList: [Media] = []
    @Published var playingList: [Media] = []
    @Published var upcomingList: [Media] = []
    @Published var topRatedList: [Media] = []

    @Published var isLoading = false

    private var dependencies: Dependencies
    private var cancellables = Set<AnyCancellable>()

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func setup() {
        fetchMovies(target: .popularList)
        fetchMovies(target: .upcomingList)
        fetchMovies(target: .topRatedList)
        fetchMovies(target: .playingList)
    }

    func fetchMovies(target: MovieTarget) {
        isLoading = true
        dependencies
            .movieService
            .movieList(target: target)
            .receive(on: DispatchQueue.main)
            .sink { _ in
            } receiveValue: { [weak self ] response in
                switch target {
                case .popularList:
                    self?.popularList = response.results
                case .playingList:
                    self?.playingList = response.results
                case .topRatedList:
                    self?.topRatedList = response.results
                case .upcomingList:
                    self?.upcomingList = response.results
                }
                self?.isLoading = false
            }.store(in: &cancellables)
    }
}

struct HomeViewModelDependencies: HomeViewModel.Dependencies {
    let movieService: MovieServiceType = MovieService(
        dependencies: MovieServiceDependencies()
    )
}
