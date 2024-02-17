//
//  DetailViewModel.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 17.02.2024.
//

import Foundation

class DetailViewModel : ObservableObject {
    
    let movie: Movie
    let sections: [DetailViewSection] = [.about,.review ]
    @Published var selectedSection: DetailViewSection = .about
    init(movie: Movie) {
        self.movie = movie
    }
    
}
