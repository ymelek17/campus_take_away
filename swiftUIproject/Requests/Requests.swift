//
//  Requests.swift
//  Requests
//
//  Created by Yasemin Melek on 12.04.2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class Requests: ObservableObject {
        
    init() {}


    var auth = 0
    //MARK:  USER REQUESTS
    
    func getUser(username: String){
        
        let URL = "https://runnin21.herokuapp.com/user/" + username
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            user.first_name = json["first_name"].description
            user.last_name = json["last_name"].description
            user.email = json["email"].description
            user.date_of_birth = json["date_of_birth"].description
            user.password = json["password"].description
            user.phone_number = json["phone_number"].description
            user.university = json["university"].description
            user.gender = json["gender"].description
        }
    }
    
    func createUser(customer: Customer){
        
        let URL = "https://runnin21.herokuapp.com/user/" + customer.username
        
        AF.request(URL, method: .post, parameters: ["username": customer.username, "first_name": customer.first_name, "email": customer.email, "password": customer.password, "last_name": customer.last_name, "phone_number": customer.phone_number, "university": customer.university,"date_of_birth": customer.date_of_birth, "gender": customer.gender], encoder:  JSONParameterEncoder.default).validate(contentType: ["application/json"]).responseJSON { response in
                let result = response.data
                let json = JSON(result!)
                print(json)
        }
    }
    
    
    //MARK: AUTHENTICATE
    
    func authenticate(email: String, password: String) {
        
        let URL = "https://runnin21.herokuapp.com/authenticate"
    
        AF.request(URL, method: .post, parameters: ["email": email, "password": password], encoder: JSONParameterEncoder.default).validate(contentType: ["application/json"]).responseJSON { response in
            debugPrint(response)
            if (response.description.contains("Authetication Successful")){
                self.auth = 1
            }
            else {
                self.auth = 2
            }
        }
    }
    
    func getCafe(){
        
        let URL = "https://runnin21.herokuapp.com/cafe/KocUniversity"
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            print(json)
        }
    }
    
    func getMenu(name: String){
        
        let URL = "https://runnin21.herokuapp.com/menu/" + name
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            for i in 0..<json.count{
                prod.product_id = json[String(i)]["product_id"].description
                prod.product_name = json[String(i)]["product_name"].description
                prod.price = json[String(i)]["price"].description
                prod.product_description = json[String(i)]["product_description"].description
                products.append(prod)
            }
        }
    }
    
    
    //MARK: BASKET REQUESTS
    
    func getBasket(customer: Customer){
        
        let URL = "https://runnin21.herokuapp.com/basket/" + customer.username
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            for i in 0..<json.count{
                prod.product_id = json[String(i)]["product_id"].description
                prod.product_name = json[String(i)]["product_name"].description
                prod.price = json[String(i)]["price"].description
                prod.product_description = json[String(i)]["product_description"].description
                basketProducts.append(prod)
            }
            print(basketProducts)
        }
    }
     

    func basketAdd(product: Product, username: String) {
        
        let URL = "https://runnin21.herokuapp.com/basket/" + username

        AF.request( URL, method: .post, parameters: ["product_id": product.product_id, "product_name": product.product_name, "price": product.price, "product_description": product.product_description], encoder: JSONParameterEncoder.default).validate(contentType:  ["application/json"]).responseJSON { response in
            debugPrint(response)
        }
    }
    
    func basketDrop(product: Product, customer: Customer) {
        
        let URL = "https://runnin21.herokuapp.com/rembasket/" + customer.username

        AF.request( URL, method: .post, parameters: ["product_name": product.product_name], encoder: JSONParameterEncoder.default).validate(contentType:  ["application/json"]).responseJSON { response in
            debugPrint(response)
        }
    }
    
    func emptyBasket(customer: Customer){
        
        let URL = "https://runnin21.herokuapp.com/empbasket/" + customer.username
        AF.request(URL, method: .get).responseJSON { response in
                debugPrint(response)
        }
    }
    
    func totalBasket(customer: Customer){ // NOT WORKING
        
        let URL = "https://runnin21.herokuapp.com/totbasket/" + customer.username
        AF.request(URL, method: .get).responseJSON { response in
                debugPrint(response)
        }
    }
    
    func orderEvent(name: String, customer: Customer){
        
        let URL = "https://runnin21.herokuapp.com/orderevent/" + name
        AF.request( URL, method: .post, parameters: ["username": customer.username, "timeslot": "9"], encoder: JSONParameterEncoder.default).validate(contentType:  ["application/json"]).responseJSON { response in
            debugPrint(response)
        }
    }

    func getActiveOrders(name: String){
        
        let URL = "https://runnin21.herokuapp.com/orderevent/" + name
        AF.request(URL, method: .get).responseJSON { response in
            debugPrint(response)
        }
    }
    
}
 





