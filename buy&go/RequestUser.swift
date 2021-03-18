//
//  RequestUser.swift
//  Demo2
//
//  Created by Yasemin Melek on 11.03.2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class RequestUser {
    
    var auth = false
    var signup = false
    
    struct Customer: Encodable {
        var firstName: String
        var lastName: String
        var email: String
        var password: String
        var phoneNumber: String
        var university: String
        var type: String
        var dateOfBirth: String
        var gender: String
    }
    
   func AuthenticateUser(email: String, password: String){
    
    AF.request("https://runnin21.herokuapp.com/authenticate/sulo28", method: .post, parameters: ["email": email, "password": password], encoder: JSONParameterEncoder.default).validate(contentType: ["application/json"]).responseJSON { response in
            debugPrint(response)
            if (response.description.contains("authentication = 1")){
                self.auth = true
            }
        }
   }

    func signUp(customer: Customer){
        
        AF.request("https://runnin21.herokuapp.com/user/sulo28", method: .post, parameters: ["firstName": customer.firstName, "email": customer.email, "password": customer.password, "lastName": customer.lastName, "phoneNumber": customer.phoneNumber, "university": customer.university, "type": customer.type, "dateOfBirth": customer.dateOfBirth, "gender": customer.gender], encoder: JSONParameterEncoder.default).validate(contentType: ["application/json"]).responseJSON { response in
            debugPrint(response)
            if (response.description.contains("1")){
                self.signup = true
            }
        }
    }

}
 

