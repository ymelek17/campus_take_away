//
//  ProductOnListView.swift
//  swiftUIproject
//
//  Created by aslyy on 10.04.2021.
//

import SwiftUI

struct ProductOnListView: View {
    
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 6, content: {

            Text(product.product_name).font(.title3).fontWeight(.black)
            Text(product.product_description).fontWeight(.semibold).foregroundColor(.gray)
            HStack(alignment: .center, spacing: 30, content: {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "plus")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                })
                Text(String(product.price) + " TL").font(.title3).fontWeight(.black).foregroundColor(.blue)
            })

        })
    }
    
}

struct ProductOnListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductOnListView(product: products[0])
            .previewLayout(.sizeThatFits)
            .padding()

    }
}
