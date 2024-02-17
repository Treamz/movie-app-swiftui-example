//
//  Genre.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 16.02.2024.
//

import Foundation


struct Genre : Identifiable, Codable {
    let id: Int
    let name: String
}


struct GenreResponse: Codable {
    let genres: [Genre]
}
