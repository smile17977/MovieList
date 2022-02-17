//
//  TVMoviesView.swift
//  MoviePremieresList
//
//  Created by Kirill Presnyakov on 17.02.2022.
//

import SwiftUI

struct TVMoviesView: View {
    var body: some View {
        NavigationView {
            TabView {
                TVPremieresView()
                    .tabItem {
                        VStack {
                            Image(systemName: "newspaper.fill")
                            Text("Premieres")
                        }
                    }
                
                TVBestFilmsView()
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
