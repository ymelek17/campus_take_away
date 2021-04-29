//
//  Customer.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 10.04.2021.
//

import Foundation


struct Customer: Codable {
    var username: String
    var first_name: String
    var last_name: String
    var email: String
    var password: String
    var phone_number: String
    var university: String
    var date_of_birth: String
    var gender: String
}


var user = Customer(username: "yasyas", first_name: "", last_name: "", email: "", password: "", phone_number: "", university: "", date_of_birth: "", gender: "")



