//
//  TVBestFilmsView.swift
//  tvOS
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

import SwiftUI

struct TVBestFilmsView: View {
    @ObservedObject private var viewModel: BestFilmsViewModel = .init()
    
    var body: some View {
            movies
    }
    
    private var movies: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.bestFilms) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        AsyncImage(viewModel: .init(url: movie.posterUrlPreview))
                            .frame(width: 300, height: 400)
                    }
                }
                
                Button(action: viewModel.loadNextPage) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.title)
                        .padding(.horizontal)
                }
            }
            .padding(80)
        }
        .padding(-80)
        .padding()
    }
}
