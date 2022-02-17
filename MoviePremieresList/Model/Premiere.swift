//
//  Premiere.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

struct PremieresResponse<T: Decodable>: Decodable {
    let total: Int
    let items: [T]
}
 
struct Premiere: Decodable, MovieProtocol {
    let kinopoiskId: Int
    let nameRu: String
    let nameEn: String?
    let year: Int
    let posterUrl: String
    let posterUrlPreview: String
    let countries: [Country]
    let genres: [Genre]
    let duration: Int
    let premiereRu: String?
    
    var filmYear: String {
        String(year)
    }
}

extension Premiere: Identifiable {
    var id: Int { kinopoiskId }
}
