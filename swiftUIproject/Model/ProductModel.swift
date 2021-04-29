


import Foundation

struct Product: Codable {
    var product_id: String
    var product_name: String
    var price: String
    var product_description: String
}

extension Product: Identifiable {
    var id: String { return product_id }
}

var prod = Product(product_id: "", product_name: "", price: "", product_description: "")

