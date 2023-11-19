//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 27/6/23.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(dependencies: HomeViewModelDependencies()))
        }
    }
}
