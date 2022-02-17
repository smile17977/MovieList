//
//  MoviePremieresListView.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 14.02.2022.
//

import SwiftUI

struct MoviePremieresListView: View {
    @ObservedObject private var viewModel = MoviePremieresListViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                controls
                movies
            }
            .padding()
        }
    }
    
    private var controls: some View {
        HStack {
            Text("Year:")
                .padding(.trailing)
            
            Picker(viewModel.selectedYear, selection: $viewModel.selectedYear) {
                ForEach(viewModel.years, id: \.self) { year in
                    Text(year)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            Spacer()
            
            Text("Month:")
                .padding(.trailing)
            
            
            Picker(viewModel.selectedMonth, selection: $viewModel.selectedMonth) {
                ForEach(viewModel.months, id: \.self) { month in
                    Text(month)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
    
    private var movies: some View {
        ForEach(viewModel.movies) { movie in
            AsyncImage(viewModel: .init(url: movie.posterUrlPreview))
        }
    }
}

struct MoviePremieresListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePremieresListView()
    }
}
