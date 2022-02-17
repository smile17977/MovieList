//
//  MovieDetailsView.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 15.02.2022.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: MovieProtocol
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(viewModel: .init(url: movie.posterUrl))
                    .frame(width: 300, height: 400)
                
                HStack {
                    Text("Название: ")
                        .font(.title)
                    
                    Text(movie.nameRu)
                        .font(.title)
                        .foregroundColor(.primary)
                }
                .padding(.vertical)
                
                Text("Продолжительность: \(movie.duration)")
                    .font(.title2)
                    .padding(.bottom)
                
                Text("Год выпуска: \(movie.filmYear)")
                    .font(.title2)
                    .padding(.bottom)
                
                HStack {
                    Text("Страны: ")
                        .font(.title2)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(movie.countries, id: \.self) { country in
                                Text(country.country)
                            }
                        }
                    }
                }
                .padding(.bottom)
                
                HStack {
                    Text("Жанры: ")
                        .font(.title2)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(movie.genres, id: \.self) { genre in
                                Text(genre.genre)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}
