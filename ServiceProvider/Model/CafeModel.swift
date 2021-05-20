//
//  CafeModel.swift
//  ServiceProvider14Ap
//
//  Created by Yasemin Melek on 28.04.2021.
//

import Foundation


struct CafeModel: Codable {
    var company_name: String
    var email: String
    var password: String
    var phone_number: String
    var university: String
    var location_info: String
    var opening_hour: String
    var closing_hour: String
    var timeslots: [String]
}

var cafe = CafeModel(company_name: "", email: "", password: "", phone_number: "", university: "", location_info: "", opening_hour: "8", closing_hour: "18", timeslots: [])

