//
//  DetailView.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 17.02.2024.
//

import SwiftUI


enum DetailViewSection: String {
    case about,review
    
    var rawValue: String {
        switch self {
        case .about:
            return "About movie"
        case .review:
            return "Review"
        }
    }
     
}
struct DetailView: View {
    @StateObject private var vm : DetailViewModel
    @Environment(\.presentationMode) var presentationMode 
    @Namespace var namespace
    
    init(movie: Movie) {
       _vm = StateObject(wrappedValue: DetailViewModel(movie:  movie))
    }
    var body: some View {
        VStack(alignment: .leading) {
            header
            VStack {
                HStack {
                    Image.CalendarIcon
                    Text(vm.movie.releaseDate)
                    Text("|")
                    Image.ClockIcon
                    Text("148 Minutes")
                    Text("|")
                    Image.GenreIcon
                    Text("Action")
                }
                .foregroundColor(.AppGrayColor2)
                .frame(width: .infinity)
                
                HStack {
                    ForEach(vm.sections,id: \.self) { section in
                        DetailSectionCard(section: section, selectedSection: $vm.selectedSection, namespace: namespace)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    vm.selectedSection = section
                                }
                            }
                    }
                }
                Spacer()
            }
            .padding()
            .padding(.top,contentOffset)
        }
        .preferredColorScheme(.dark)
        .background(Color.appBackground)
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.35
    }
    var backdropImageSize: CGFloat {
        screenHeight * 0.22
    }
    var backdropImageOffset: CGFloat {
        screenHeight * 0.15
    }
    
    var titleOffset: CGFloat {
        screenHeight * 0.12
    }
    
    var contentOffset: CGFloat {
        screenHeight * 0.10
    }
}

struct DetailView_Preview: PreviewProvider {
  static var previews: some View {
      DetailView(movie: dev.movie)
  }
}


private extension DetailView {
    var header: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .top) {
                CustomImageView(itemWidth: screenWidth, itemHeight: posterImageHeight, movie: vm.movie)
                HStack {
                    Image.BackIcon.onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Text("Detail")
                    Spacer()
                    Image.BookmarkIcon
                }
                .padding()
                .background(Color.appBackground)
            }
            HStack {
                CustomImageView(itemWidth: backdropImageSize, itemHeight: backdropImageSize, movie: vm.movie,imageType: .backdrop)
                Text(vm.movie.title)
                    .minimumScaleFactor(0.5)
                    .padding(.top,titleOffset)
            }
            .padding()
            .offset(y:backdropImageOffset)
        }
    }
}
