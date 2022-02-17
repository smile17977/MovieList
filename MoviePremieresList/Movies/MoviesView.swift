//
//  MoviesView.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 15.02.2022.
//

import SwiftUI

struct MoviesView: View {
    var body: some View {
        VStack {
            TabView {
                PremieresView()
                    .tabItem {
                        VStack {
                            Image(systemName: "newspaper.fill")
                            Text("Premieres")
                        }
                    }
                
                BestFilmsView()
                    .tabItem {
                        VStack {
                            Image(systemName: "star.fill")
                            Text("Best Films")
                        }
                    }
            }
        }
    }
}
