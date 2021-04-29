//
//  ProductOnListView.swift
//  swiftUIproject
//
//  Created by aslyy on 10.04.2021.
//

import SwiftUI

struct ProductsBasketView: View {
    
    let product: Product
    @State private var emptyBasket = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {
            
            HStack(alignment: .center, spacing: 30, content: {
                Text(product.product_name).font(.title3).fontWeight(.black)
                Spacer()
                Text("1").font(.title3).fontWeight(.black).foregroundColor(.black)
            })
            Text(product.product_description).fontWeight(.semibold).foregroundColor(.gray)
            HStack(alignment: .center, spacing: 30, content: {
                Text(String(product.price) + " TL").font(.title3).fontWeight(.black).foregroundColor(.blue)
            })
        }).padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(gradient: Gradient(colors: [Color(.white), Color(.white)]), startPoint: .top, endPoint: .bottom))
                .shadow(color: Color(.black), radius: 6, x: 3, y: 3)
          )
    }
    
}

struct ProductsBasketView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsBasketView(product: basketProducts[0])
            .previewLayout(.sizeThatFits)
            .padding()

    }
}
