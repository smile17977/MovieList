//
//  Film.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 17.02.2022.
//


struct BestFilmsResponse<T: Decodable>: Decodable {
    let pagesCount: Int
    let films: [T]
}

struct Film: Decodable, MovieProtocol {
    let filmId: Int
    let nameRu: String
    let nameEn: String?
    let year: String
    let posterUrl: String
    let posterUrlPreview: String
    let countries: [Country]
    let genres: [Genre]
    let filmLength: String
    let rating: String?
    let ratingVoteCount: Int?
    
    var filmYear: String {
        year
    }
}

extension Film: Equatable { }

extension Film: Identifiable {
    var id: Int { filmId }
    var duration: Int { Int(filmLength) ?? 0 }
}
