//
//  Optional.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 24.01.2024.
//

import Foundation

extension Optional where Wrapped ==  String {
    var stringValue: String {
        guard let self = self else {return ""}
        return self
    }
}
