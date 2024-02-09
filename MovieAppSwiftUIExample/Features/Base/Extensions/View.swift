//
//  View.swift
//  Movie
//
//  Created by Ahmed Ali on 19/04/2023.
//

import SwiftUI

extension View {
    func poppins(_ font: Poppins, _ size: CGFloat = 14) -> some View {
        self.font(.custom(font.fontName, size: size))
    }
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}

/*
    Text("Hello")
        .poppins(.medium, 18)
 
 */
