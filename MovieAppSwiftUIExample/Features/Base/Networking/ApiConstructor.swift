//
//  ApiConstructor.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 09.02.2024.
//

import Foundation


typealias Parameters = [String: String]
struct ApiConstructor {
    let endpoint: Endpoint
    var params: Parameters = [:]
}
