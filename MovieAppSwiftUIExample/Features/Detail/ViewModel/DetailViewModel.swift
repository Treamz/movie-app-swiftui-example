//
//  DetailViewModel.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 17.02.2024.
//

import Foundation

@MainActor
class DetailViewModel : ObservableObject {
    
    let movie: Movie
    let sections: [DetailViewSection] = [.about,.review ]
    @Published var selectedSection: DetailViewSection = .about
    
    @Published var reviews: [Review] = []
    
    @Published var errorMsg = ""
    
    private let movieService: MovieService = MovieService()
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchReviews() async {
        do {
            let response : ReviewResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movie.id)))
            print(response)
            reviews = response.results
        }
        catch {
            errorMsg = "Error \(error)"
            print("Error \(error)")
        }
    }
    
}
