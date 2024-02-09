//
//  Endpoints.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 09.02.2024.
//

import Foundation


enum Endpoint {
    case trending, topRated, genre, movieReviews(_ movieId: Int)
    
    private var path : String {
        switch self {
        case .trending:
            return "/3/trending/movie/week"
        case .topRated:
            return "/3/movie/top_rated"
        case .genre:
            return "/3/genre/movie/list"
        case .movieReviews(let movieId):
            return "/3/movie/\(movieId)reviews"
        }
    }
    
    var fullPath : String {
        Constants.apiBaseUrl + path
    }
}
