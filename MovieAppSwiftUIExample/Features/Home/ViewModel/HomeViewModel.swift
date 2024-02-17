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
    @Published var moviesForSelectedGenre: [Movie] = []
    @Published var genre: [Genre] = []
    @Published var selectedGenre: Genre = DeveloperPreview.instance.genre
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
    
    
    func fetchGenre() async {
        do {
            let response : GenreResponse  = try await movieService.fetchData(api: .init(endpoint: .genre))
            
            genre = response.genres
            if let genre = genre.first {
                selectedGenre = genre
//                await fetchMoviesForSelectedGenre()
            }
            
        }catch {
            errorMsg = "Error: \(error)"
        }
    }
    
    func fetchMoviesForSelectedGenre() async {
        do {
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .discoverMovies,params: [
                "with_genres": "\(selectedGenre.id)"]))
            self.moviesForSelectedGenre = movieApiResponse.results
        }
        catch {
            errorMsg = "Error: \(error)"
        }
    }
}
