//
//  SearchBar.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 24.01.2024.
//

import SwiftUI
 
struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        TextField("Search",text: $searchText)
            .overlay (
                ZStack {
                    Image.CancelIcon
                        .foregroundColor(.white)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0 )
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        }
                    Image.SearchIcon
                        .opacity(searchText.isEmpty ? 1.0 : 0.0 )
                }
                , alignment: .trailing)
            .foregroundStyle(.appGrayColor2)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20).fill(.appGrayColor1))
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
