//
//  DefaultUrlBuilder.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 09.02.2024.
//

import Foundation

enum DefaultUrlBuilderError: Error {
    case invalidPath, invalidUrl
}


enum DefaultUrlBuilder {
    static func build(api: ApiConstructor) throws -> URL {
        guard var urlComponents = URLComponents(string: api.endpoint.fullPath) else {
            throw DefaultUrlBuilderError.invalidPath
        }
        urlComponents.queryItems = buildQuaryParams(api.params, ["api_key" : Constants.apiKey])
        guard let url = urlComponents.url else {
            throw DefaultUrlBuilderError.invalidUrl
        }
        return url
    }
    
    static func buildQuaryParams(_ params: Parameters...) -> [URLQueryItem] {
        params.flatMap {$0}.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
    }
}
