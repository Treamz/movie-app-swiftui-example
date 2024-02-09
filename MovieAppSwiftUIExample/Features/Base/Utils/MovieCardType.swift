//
//  MovieCardType.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 08.02.2024.
//

import Foundation

enum MovieCardType {
    case poster, grid
}

extension MovieCardType {
    var widthPercent: Double {
        switch self {
        case .poster:
            return 0.45
        case .grid:
            return 0.30
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .poster:
            return 0.30
        case .grid:
            return 0.15
        }
    }
}
