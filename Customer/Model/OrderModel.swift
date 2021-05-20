//
//  OrderModel.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 19.05.2021.
//

import Foundation


struct Order: Identifiable, Codable {
    var id: String
    var description: [Product]
    var time: String
    var cafe: String
}

var order = Order(id: "", description: [], time: "", cafe: "")
