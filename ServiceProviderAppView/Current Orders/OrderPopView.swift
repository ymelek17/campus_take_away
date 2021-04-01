
import SwiftUI

struct OrderPopView: View {

  var orderinfo: OrderInfo
  
  var body: some View {
    VStack(alignment: .center, spacing:10) {
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "person.fill")
        Text("Customer: \(orderinfo.customer)")
            .font(.body)
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "hourglass")
        Text("Time: \(orderinfo.time)")
            .font(.body)
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "creditcard.fill")
        Text("Total: \(orderinfo.total)" + "₺")
            .font(.body)
      }
    }
    .font(.footnote)
    .foregroundColor(Color.black)
  }
}

struct OrderPopView_Previews: PreviewProvider {
  static var previews: some View {
    OrderPopView(orderinfo: OrderInfoData[0])
      .previewLayout(.fixed(width: 320, height: 60))
  }
}
