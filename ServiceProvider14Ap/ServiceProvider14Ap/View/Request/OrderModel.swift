

import SwiftUI


struct Order: Identifiable {
  var id = UUID()
  var orderNo: String
  var customer: String
  var description: String

}
