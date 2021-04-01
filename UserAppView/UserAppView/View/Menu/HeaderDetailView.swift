//
//  HeaderDetailView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct HeaderDetailView: View {

  
  // MARK: - BODY
  
  var body: some View {
    VStack(alignment: .leading, spacing: 6, content: {
      
      Text(sampleBrand.name)
        .font(.largeTitle)
        .fontWeight(.black)
    }) //: VSTACK
    .foregroundColor(.white)
  }
}

// MARK: - PREVIEW

struct HeaderDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color.gray)
  }
}
