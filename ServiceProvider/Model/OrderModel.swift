

import SwiftUI

class OrderData: ObservableObject {
    @Published var savedList: [Order] = []
    @Published var previousOrderList: [Order] = previousList
}

struct Order: Identifiable {
  var id = String()
  var orderNo: String
  var customer: Customer
  var description: [String] 
    var time: String
    var total: String
    var accepted: Bool
}


var order = Order(id: "", orderNo: "", customer: cust, description: [""], time: "", total: "", accepted: false)
var orderList = [Order] ()
var previousList = [Order] ()
var acceptedOrderList = [Order] ()


