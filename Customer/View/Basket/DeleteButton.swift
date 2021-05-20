//
//  DeleteButton.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 3.05.2021.
//

import SwiftUI

struct DeleteButton: View {
    
    
    @State private var deleted = false
    @State var ind: Int = 0
    @EnvironmentObject var basketInfo: BasketInfo
    @ObservedObject var requests = Requests()
    @State var product: Product
    var body: some View {
        HStack {
          Spacer()
            Button(action: {
                deleted = true
                requests.basketDrop(product: product, customer: user)
                basketInfo.basketProducts.remove(at: basketInfo.basketProducts.firstIndex(where: {$0.product_name == product.product_name})!)
                basketInfo.basket_total -= Double(product.price) ?? 0.0
                }, label:{
                    Image(systemName: "trash")
                      .font(.title)
                      .foregroundColor(.black)
                })
            .edgesIgnoringSafeArea(.all)
        }//.sheet(isPresented: self.$deleted) {
          //  BasketView()
        //}
    }
}

struct DeleteButton_Previews: PreviewProvider {
    static var previews: some View {
        DeleteButton(product: BasketInfo().basketProducts[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
