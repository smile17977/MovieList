//
//  BestFilmsView.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 15.02.2022.
//

import SwiftUI

struct BestFilmsView: View {
    @ObservedObject private var viewModel: BestFilmsViewModel = .init()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal) {
                    movies
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    private var movies: some View {
        HStack {
            ForEach(viewModel.bestFilms) { movie in
                NavigationLink(destination: MovieDetailsView(movie: movie)) {
                    AsyncImage(viewModel: .init(url: movie.posterUrlPreview))
                }
            }
            
            Button(action: viewModel.loadNextPage) {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .font(.title)
                    .padding(.horizontal)
            }
        }
    }
}
