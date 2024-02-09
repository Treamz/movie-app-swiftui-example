//
//  PreviewProvider.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 08.02.2024.
//

import SwiftUI

extension PreviewProvider {
    static var dev : DeveloperPreview {
        DeveloperPreview.instance
    }
}


class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() {
        
    }
    
    let movie: Movie = Movie(adult: false,
                             backdropPath: "/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg",
                             genreIDS: [1],
                             id: 278,
                             originalLanguage: "en",
                             originalTitle: "The Shawshank Redemption",
                             overview: "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
                             popularity: 118.686,
                             posterPath: "/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
                             releaseDate: "1994-09-23",
                             title: "The Shawshank Redemption",
                             video: false,
                             voteAverage: 8.711,
                             voteCount: 25502)
}
