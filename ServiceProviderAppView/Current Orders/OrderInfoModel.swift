
import SwiftUI


struct OrderInfo: Identifiable {
    var id = UUID()
    var customer: String
    var time: String
    var total: String
    var orderContext: [String]
}
