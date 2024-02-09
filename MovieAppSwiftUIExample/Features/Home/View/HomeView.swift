//
//  HomeView.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 24.01.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    @StateObject private var vm = HomeViewModel()
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading,spacing: 20) {
                Text("What do you want to watch?")
                    .poppins(.bold,20)
                
                SearchBar(searchText: $searchText)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(vm.trendingMovies) {movie in
                            MovieCard(movie:movie)
                        }
                    }
                }
                
                LazyVGrid(
                    columns : [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),],spacing: 20) {
                    
                        ForEach(vm.topRatedMovies) {movie in
                            MovieCard(movie: movie,type: .grid)
                        }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(.appBackground)
        .task {
            await vm.fetchTrendingMovies()
            await vm.fetchTopRatedMovies()
        }
    }
}

#Preview {
    HomeView()
}
