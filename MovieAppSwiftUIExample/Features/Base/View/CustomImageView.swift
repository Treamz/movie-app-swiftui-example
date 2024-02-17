//
//  CustomImageView.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 08.02.2024.
//

import SwiftUI

struct CustomImageView: View {
    let itemWidth : CGFloat
    let itemHeight : CGFloat
    var movie: Movie
    var imageType: MovieImageType = .poster
    var body: some View {
        AsyncImage(url: URL(string: movie.getImage(for: imageType))) { image in
            image
                .resizable()
                .scaledToFill()
            
        } placeholder: {
            ZStack {
                Color.AppGrayColor1
                Text(movie.title)
                    .padding()
            }
        }
        .frame(width: itemWidth,height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct CustomImageView_Preview: PreviewProvider {
  static var previews: some View {
      CustomImageView(itemWidth: 150,itemHeight: 150.0,movie:dev.movie)
  }
}
