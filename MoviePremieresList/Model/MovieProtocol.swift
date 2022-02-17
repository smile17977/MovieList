//
//  MovieProtocol.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 15.02.2022.
//

protocol MovieProtocol {
    var id: Int { get }
    var nameRu: String { get }
    var nameEn: String? { get }
    var posterUrl: String { get }
    var posterUrlPreview: String { get }
    var countries: [Country] { get }
    var genres: [Genre] { get }
    var duration: Int { get }
    var premiereRu: String? { get }
    var rating: String? { get }
    var ratingVoteCount: Int? { get }
    var filmYear: String { get }
}

extension MovieProtocol {
    var premiereRu: String? { nil }
    var rating: String? { nil }
    var ratingVoteCount: Int? { nil }
}
