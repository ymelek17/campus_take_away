//
//  Product.swift
//  swiftUIproject
//
//  Created by aslyy on 10.04.2021.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: String
    let product_description: String
    let price: Int
    let product_name: String
    let additional_notes: String
}
