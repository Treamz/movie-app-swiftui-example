//
//  ReviewCard.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 17.02.2024.
//

import SwiftUI

struct ReviewCard: View {
    let review: Review
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: review.authorImage)) { image in
                    
                } placeholder: {
                    Color.appGrayColor1
                    if let firstChart = review.authorName.first {
                        Text(String(firstChart))
                    }
                }
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                Text(review.authorName)
                    .poppins(.medium,16)
            }
            Text(review.content)
                .poppins(.light)
            
            Divider()
        }
    }
}


struct ReviewCard_Preview: PreviewProvider {
    static var previews: some View {
        ReviewCard(review: dev.review)
    }
}
