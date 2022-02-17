//
//  MoviesInteractor.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

import Foundation
import Combine

final class MoviesInteractor {
    func fetchMovies<M: Decodable>(url: String, model: M.Type) -> AnyPublisher<M, Error> {
        guard let request = try? URLRequestBuilder
                .makeRequest(
                    stringURL: url,
                    headers: ["X-API-KEY" : "892c73fa-08e8-460d-8e3e-68f3291521a5"]
                ) else {
            return Fail(error: URLRequestBuilder.URLRequestError.WrongURL)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: M.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
