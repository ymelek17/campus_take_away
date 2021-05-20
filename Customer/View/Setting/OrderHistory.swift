//
//  OrderHistory.swift
//  swiftUIproject
//
//  Created by aslyy on 3.05.2021.
//

import SwiftUI

struct OrderHistory: View {

    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    //var orders: [Order]
    var body: some View {
        NavigationView {
        ScrollView(.vertical, showsIndicators: true) {
          
            Group {
                //BURADA DB DEN ESKİ ORDERLARI ÇAĞIRIP REPLACE ETMEK LAZIM
                ForEach(user.order_history) { item in
                    PreviousOrder(order: item).padding()
                    Spacer()
                }
          }
          .listStyle(InsetGroupedListStyle())
          .navigationBarTitle("Order History", displayMode: .large)
            .navigationBarHidden(true)
        } //: NAVIGATION
      }
    }
}

struct OrderHistory_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistory()//orders: [])
    }
}
