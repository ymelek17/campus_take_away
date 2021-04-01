

import SwiftUI

struct AllOrderRequestsView: View {
  
  var orderRequests: [Order] = orderData
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack {
        Spacer()
        HStack(alignment: .center, spacing: 25) {
          ForEach(orderRequests) { item in
            OrderRequestView(order: item)
          }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        Spacer()
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct AllOrderRequestsView_Previews: PreviewProvider {
  static var previews: some View {
    AllOrderRequestsView(orderRequests: orderData)
  }
}
