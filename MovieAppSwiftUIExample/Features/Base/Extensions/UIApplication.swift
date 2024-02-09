//
//  UIApplication.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 24.01.2024.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
