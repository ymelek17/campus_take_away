//
//  RatingView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct RatingView: View {
 
  var body: some View {
    HStack(alignment: .top, spacing: 3, content: {
      // RATINGS
      VStack(alignment: .leading, spacing: 3, content: {
        Text("Ratings")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)
        
        HStack(alignment: .center, spacing: 3, content: {
          ForEach(1...5, id: \.self) { item in
            Button(action: {}, label: {
              Image(systemName: "star.fill")
                .frame(width: 28, height: 28, alignment: .center)
                .background(colorGray.cornerRadius(5))
                .foregroundColor(.white)
            })
          }
        })
      })
      
      Spacer()
      
    }) //: HSTACK
  }
}

// MARK: - PREVIEW

struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
    RatingView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
