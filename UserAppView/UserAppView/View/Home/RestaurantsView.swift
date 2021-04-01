//
//  RestaurantsView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct RestaurantsView: View {

  
  let brand: Brand
  
  
  var body: some View {
    VStack(alignment: .leading, spacing: 6, content: {
      // PHOTO
      ZStack {
        Image(brand.image)
          .resizable()
          .scaledToFit()
          .padding(10)
      }
      .cornerRadius(12)
      
      // NAME
      Text(brand.name)
        .font(.title3)
        .fontWeight(.black)
      
      
    })
  }
}



struct RestaurantsView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantsView(brand: brands[0])
      .previewLayout(.fixed(width: 200, height: 300))
      .padding()
      .background(colorBackground)
  }
}
