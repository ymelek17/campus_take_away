//
//  HeaderDetailView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct HeaderDetailView: View {
  
    @State var cafe_header = ""

  var body: some View {
    VStack(alignment: .leading, spacing: 6, content: {
      
        Text(cafe_header)
        .font(.largeTitle)
        .fontWeight(.black)
    }) //: VSTACK
    .foregroundColor(.white)
  }
}


struct HeaderDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDetailView(cafe_header: "")
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color.gray)
  }
}
