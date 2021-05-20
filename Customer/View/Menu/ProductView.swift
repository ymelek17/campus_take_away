//
//  Product.swift
//  swiftUIproject
//
//  Created by aslyy on 10.04.2021.
//

import SwiftUI

struct ProductView: View {

  let product: Product
  
  var body: some View {
    VStack(alignment: .leading, spacing: 2, content: {

      Text(product.product_name)
        .font(.title3)
        .fontWeight(.black)
      
      //Text(product.price).fontWeight(.semibold).foregroundColor(.gray)
    })
  }
}

struct ProductView_Previews: PreviewProvider {
  static var previews: some View {
    ProductView(product: products[0])
      .previewLayout(.fixed(width: 200, height: 300))
      .padding()
      .background(colorBackground)
  }
}
