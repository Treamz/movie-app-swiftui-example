//
//  HomeViewModel.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 09.02.2024.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    @Published var errorMsg: String = ""

    private let movieService = MovieService()
    
    func fetchTrendingMovies() async {
        
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .trending))
            self.trendingMovies = movieApiResponse.results
        }
        catch {
            errorMsg = "Error: \(error)"
        }
        
    }
    
    func fetchTopRatedMovies() async {
        
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .topRated))
            self.topRatedMovies = movieApiResponse.results
        }
        catch {
            errorMsg = "Error: \(error)"
        }
        
    }
}
