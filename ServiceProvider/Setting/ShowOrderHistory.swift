//
//  ShowOrderHistory.swift
//  ServiceProvider14Ap
//
//  Created by asli on 1.05.2021.
//

import SwiftUI

struct ShowOrderHistory: View {
    var orders: [Order]
    //@EnvironmentObject var orderData: OrderData

    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
        ScrollView(.vertical, showsIndicators: true) {
          
            Group {
                ForEach(orders) { item in
              //NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: //item.name)) {
                PreviousOrderView(order: item)
                  .padding(.vertical, 8)
              //}
            } //: LOOP
          } //: LIST
          .listStyle(InsetGroupedListStyle())
          .navigationBarTitle("Order History", displayMode: .large)
        } //: NAVIGATION
      }
    }
}

struct ShowOrderHistory_Previews: PreviewProvider {
    static var previews: some View {
        ShowOrderHistory(orders: OrderData().previousOrderList)
    }
}
