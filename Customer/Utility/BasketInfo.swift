//
//  BasketInfo.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 8.05.2021.
//

import Foundation


class BasketInfo: ObservableObject {
    @Published var basketProducts: [Product] = []
    @Published var time_slot: String = ""
    @Published var basket_total: Double = 0.0
    @Published var timeslots_cafes: [String: [String]] = ["": [""]]
    @Published var basket_confirmed: Bool = false
}
