//
//  TopPartDetailView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct TopPartDetailView: View {

  
  @State private var isAnimating: Bool = false
  
  
  var body: some View {
    HStack(alignment: .center, spacing: 6, content: {
      
      // PHOTO
      Image(sampleBrand.image)
        .resizable()
        .scaledToFit()
        .offset(y: isAnimating ? 0 : -35)
    }) //: HSTACK
    .onAppear(perform: {
      withAnimation(.easeOut(duration: 0.75)) {
        isAnimating.toggle()
      }
    })
  }
}


struct TopPartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TopPartDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
