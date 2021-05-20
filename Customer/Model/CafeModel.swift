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
    var timeslots: [String:Int]
    var timeslot_keys: [String]
}

var cafe = CafeModel(company_name: "nero", email: "", password: "", phone_number: "", university: "", location_info: "", timeslots: [:], timeslot_keys: [])
