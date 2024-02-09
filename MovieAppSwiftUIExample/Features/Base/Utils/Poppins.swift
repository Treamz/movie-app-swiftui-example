//
//  Poppins.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 24.01.2024.
//

import Foundation

enum Poppins : String {
    case black, bold, light,medium, regular, semiBold
    
    var fontName: String {
        "Poppins-\(self.rawValue.capitilizeFirstLetter)"
    }
}

