//
//  Producy.swift
//  ServiceProvider14Ap
//
//  Created by Yasemin Melek on 22.04.2021.
//

import Foundation

struct Product: Codable {
    var product_id: String
    var product_name: String
    var price: String
    var product_description: String
}
var prod = Product(product_id: "", product_name: "", price: "", product_description: "")

var menuProducts = [Product] ()



