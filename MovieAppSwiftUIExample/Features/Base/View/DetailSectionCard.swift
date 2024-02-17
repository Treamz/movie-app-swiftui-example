//
//  DetailSectionCard.swift
//  MovieAppSwiftUIExample
//
//  Created by Иван Чернокнижников on 17.02.2024.
//

import SwiftUI

struct DetailSectionCard: View {
    let section: DetailViewSection
    @Binding var selectedSection: DetailViewSection
    let namespace: Namespace.ID
    var body: some View {
        Text(section.rawValue)
            .poppins(.medium,16)
            .background(ZStack {
                if section == selectedSection {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 3)
                        .offset(y:20)
                        .matchedGeometryEffect(id: "DetailSectionCard", in: namespace )
                }
            })
            .padding() 
    }
}

struct DetailSectionCard_Preview: PreviewProvider {
  static var previews: some View {
      DetailSectionCard(section: .about, selectedSection: .constant(.about), namespace: Namespace().wrappedValue)
  }
}
