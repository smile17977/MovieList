//
//  BestFilmsViewModel.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

import Foundation
import Combine

final class BestFilmsViewModel: ObservableObject {
    @Published var bestFilms: [Film] = .init()
    @Published var isLoading = false
    
    private var page = 1
    
    private let interactor = MoviesInteractor()
    
    private var disposables = Set<AnyCancellable>()
    
    init() {
        getBestFilms(page: page)
    }
    
    func loadNextPage() {
        page += 1
        
        getBestFilms(page: page)
    }
    
    private func getBestFilms(page: Int) {
        guard !isLoading else { return }
        
        isLoading = true
        
        let url = "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=\(page)"
        
        interactor
            .fetchMovies(url: url, model: BestFilmsResponse<Film>.self)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] response in
                self?.bestFilms.append(contentsOf: response.films)
            }
            .store(in: &disposables)
    }
}
