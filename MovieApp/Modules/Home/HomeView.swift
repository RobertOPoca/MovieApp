//
//  HomeView.swift
//  MovieApp
//
//  Created by Roberto De la O Pocasangre on 16/11/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject  var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            LinearGradient(stops: [
                .init(color: Color(R.color.violet), location: 0.45),
                .init(color: Color(R.color.outerSpace), location: 0.55)],
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Text(R.string.localizable.homeTitle)
                        .foregroundStyle(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            mediaList(title: String(resource: R.string.localizable.homeMoviePlaying),
                                      medias: viewModel.playingList,
                                      size: geometry.size)
                            mediaList(title: String(resource: R.string.localizable.homeMoviePopulars),
                                      medias: viewModel.popularList,
                                      size: geometry.size)
                            mediaList(title: String(resource: R.string.localizable.homeMovieTopRated),
                                      medias: viewModel.topRatedList,
                                      size: geometry.size)
                            mediaList(title: String(resource: R.string.localizable.homeMovieUpcoming),
                                      medias: viewModel.upcomingList,
                                      size: geometry.size)
                            Spacer()
                        }
                    }
                }.padding()
            }
        }
        .onAppear(perform: viewModel.setup)
    }

    func mediaList(title: String, medias: [Media], size: CGSize) -> some  View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(.white)
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(medias, id: \.self) { movie in
                        MediaCardView(media: movie)
                            .frame(width: size.width * 0.38,
                                   height: size.height * 0.42)
                    }
                }
            }
            .cornerRadius(8)
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(dependencies: HomeViewModelDependencies()))
}
