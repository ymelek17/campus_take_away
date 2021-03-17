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
    
    struct User: Encodable {
        let email: String
        let password: String
    }
    
   func getUser(){
       
   /*       let login = Login(email: "polata@sefir.ist", password: "elif12")
       
       let jsonEncoder = JSONEncoder()
       let parameterEncoder = JSONParameterEncoder(encoder: jsonEncoder)
       

       let url = URL(string: "https://runnin21.herokuapp.com/authenticate/sulo12/get")!
       let urlRequest = URLRequest(url: url)
       let parameters = ["email": "polata@sefir.ist", "password": "elif12"]
       let encodedJSONRequest = try! JSONParameterEncoder.default.encode(parameters,into: urlRequest)
   */
    let parameters: [String: [String]] = [
        "email": ["polata@sefir.ist"],
        "password": ["elif12"],
    ]
    do {
        let data = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        let jsonString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        let urlEncodedJson = jsonString!
        let urlString = "https://runnin21.herokuapp.com/authenticate/sulo12/&params=\(urlEncodedJson)"
        let url = NSURL(string: urlString)
        // Trigger alaomofire request with url
    }
    catch let JSONError as NSError {
        print("\(JSONError)")
    }
       
       
   /*        AF.request("https://runnin21.herokuapp.com/authenticate/sulo12", method: .get, parameters: login, encoder: parameterEncoder).responseJSON { response in
           debugPrint(response)
       }*/
   /*     AF.request("https://runnin21.herokuapp.com/authenticate/sulo12", method: .get, parameters: ["email": "polata@sefir.ist", "password": "elif12"]).validate(contentType: ["application/json"]).responseJSON { response in
           debugPrint(response)
       }*/
                 
   }
      
    func postUser(email: String, password: String){
        
        AF.request("https://runnin21.herokuapp.com/user/sulo12", method: .post, parameters: ["email": email, "password": password], encoder: JSONParameterEncoder.default).validate(contentType: ["application/json"]).responseJSON { response in
            debugPrint(response)
        }
        
    }

}
 
