//
//  String.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 24.01.2024.
//

import Foundation


extension String {
    var capitilizeFirstLetter: String {
        if self.count == 0 {return self}
        
        return prefix(1).uppercased() + dropFirst()
    }
}
