//
//  PremieresViewModel.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

import Combine
import Foundation

final class PremieresViewModel: ObservableObject {
    
    var months: [String]
    var years: [String]
    
    @Published var premieres: [Premiere] = .init()
    
    @Published var selectedMonth: String
    @Published var selectedYear: String
    
    private let interactor = MoviesInteractor()
    
    private var disposables = Set<AnyCancellable>()
    
    init() {
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        years = ((currentYear - 10)...currentYear).map { String($0) }
        months = calendar.monthSymbols.map { $0.uppercased() }
        selectedMonth = months.first ?? ""
        selectedYear = years.first ?? ""
        
        bind()
        
        getPremieres(for: selectedMonth, and: selectedYear)
    }
    
    func bind() {
        $selectedMonth
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] month in
                guard let self = self else { return }
                self.getPremieres(for: self.selectedMonth, and: self.selectedYear)
            }
            .store(in: &disposables)
        
        $selectedYear
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] year in
                guard let self = self else { return }
                self.getPremieres(for: self.selectedMonth, and: self.selectedYear)
            }
            .store(in: &disposables)
    }
    
    func getPremieres(for month: String, and year: String) {
        let url = "https://kinopoiskapiunofficial.tech/api/v2.2/films/premieres?year=\(year)&month=\(month)"
        
        interactor
            .fetchMovies(url: url, model: PremieresResponse<Premiere>.self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finished")
                case let .failure(error):
                    print("failed: \(error)")
                }
            } receiveValue: { [weak self] response in
                self?.premieres = response.items
            }
            .store(in: &disposables)
    }
}
