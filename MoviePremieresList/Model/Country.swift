//
//  Country.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

struct Country: Decodable {
    let country: String
}

extension Country: Hashable { }
