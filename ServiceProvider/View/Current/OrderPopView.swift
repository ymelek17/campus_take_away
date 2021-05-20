
import SwiftUI

struct OrderPopView: View {

 @State var order: Order

  var body: some View {
    VStack(alignment: .center, spacing:10) {
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "person.fill")
        Text("Customer: \(order.customer.username)")
            .font(.body)
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "hourglass")
        Text("Time: \(order.time)")
            .font(.body)
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "creditcard.fill")
        Text("Total: \(order.total)" + "₺") 
            .font(.body)
      }
    }
    .font(.footnote)
    .foregroundColor(Color.black)
  }
}

struct OrderPopView_Previews: PreviewProvider {
  static var previews: some View {
    OrderPopView(order: OrderData.init().savedList[0])
      .previewLayout(.fixed(width: 320, height: 60))
  }
}
