//
//  PreviousOrderView.swift
//  ServiceProvider14Ap
//
//  Created by aaa on 1.05.2021.
//

import SwiftUI

struct PreviousOrderView: View {
    var order: Order

    var body: some View {
        VStack(spacing: 0) {
          HStack {
            Text(order.customer.username)
                .font(.body)
            Spacer()
            Text(order.total + "TL")
                .font(.body)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                
          }.padding()
          
            VStack(alignment: .leading, spacing: 5) {
              ForEach(order.description, id: \.self) { item in
                VStack(alignment: .leading, spacing: 5) {
                  Text(item)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                  Divider()
                }
              }
            }.padding()
            
        } 
      }
}

struct PreviousOrderView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousOrderView(order: order)
    }
}
