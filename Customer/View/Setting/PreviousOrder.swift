//
//  PreviousOrder.swift
//  swiftUIproject
//
//  Created by aslyy on 3.05.2021.
//

import SwiftUI

struct PreviousOrder: View {
    let order: Order

    var body: some View {
        VStack(spacing: 0) {
          HStack {
            Text(order.cafe)
                .font(.body)
            Spacer()
            Text(order.time)
                .font(.body)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
            Reorder()
          }.padding()
          
            VStack(alignment: .leading, spacing: 5) {
              ForEach(order.description) { item in
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.product_name)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                  Divider()
                }
              }
            }.padding()
            
        }
      }
}

struct PreviousOrder_Previews: PreviewProvider {
    static var previews: some View {
        PreviousOrder(order: user.order_history[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
