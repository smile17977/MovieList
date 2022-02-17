//
//  Genre.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

struct Genre: Decodable {
    let genre: String
}

extension Genre: Hashable { }
