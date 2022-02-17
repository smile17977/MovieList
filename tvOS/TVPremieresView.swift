//
//  TVPremieresView.swift
//  tvOS
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

import SwiftUI

struct TVPremieresView: View {
    @ObservedObject private var viewModel: PremieresViewModel = .init()
    
    var body: some View {
        VStack {
            controls
                .padding([.bottom, .horizontal])
            
            movies
            
            Spacer()
        }
        .padding()
    }
    
    private var controls: some View {
        VStack {
            HStack {
                Text("Year")
                    .padding(.trailing, 5)
                
                Picker("", selection: $viewModel.selectedYear) {
                    ForEach(viewModel.years, id: \.self) { year in
                        Text(year)
                    }
                }
            }
            HStack {
                Text("Month")
                    .padding(.trailing, 5)
                Picker("", selection: $viewModel.selectedMonth) {
                    ForEach(viewModel.months, id: \.self) { month in
                        Text(month)
                    }
                }
            }
        }
    }
    
    private var movies: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.premieres) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        AsyncImage(viewModel: .init(url: movie.posterUrlPreview))
                            .frame(width: 300, height: 400)
                    }
                }
            }
            .padding(80)
        }
        .padding(-80)
        .padding()
    }
}
