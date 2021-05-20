//
//  Requests.swift
//  Requests
//
//  Created by Yasemin Melek on 12.04.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftUI

class Requests: ObservableObject {
            
    init() {}
    
    var myGroup = DispatchGroup()
    var auth = 0
    var createCafe = false
    
    
    //MARK: CAFE REQUESTS
    
    func getCafe(cafe_model: CafeModel){
        
        let URL = "https://runnin21.herokuapp.com/getcafe/" + cafe.company_name
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            print(json)
            cafe.company_name = json["company_name"].description
            cafe.email = json["email"].description
            cafe.password = json["password"].description
            cafe.phone_number = json["phone_number"].description
            cafe.university = json["university"].description
            cafe.location_info = json["location_info"].description
            cafe.opening_hour = json["Opening Hour"].description
            cafe.closing_hour = json["Closing Hour"].description
            for j in 1..<json["Timeslots"].count + 1{
                cafe.timeslots.append(json["Timeslots"]["timeslot" + String(j)].description)
            }
            print(cafe.timeslots)
        }
    }
    
    func getUser(username: String){
        
        let URL = "https://runnin21.herokuapp.com/user/" + username
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            cust.first_name = json["first_name"].description
            cust.last_name = json["last_name"].description
            cust.email = json["email"].description
            cust.date_of_birth = json["date_of_birth"].description
            cust.password = json["password"].description
            cust.phone_number = json["phone_number"].description
            cust.university = json["university"].description
            cust.gender = json["gender"].description
        }
    }
    
    
    func createCafe(cafe_model: CafeModel){
        
        let URL = "https://runnin21.herokuapp.com/cafe/KocUniversity"

        AF.request(URL, method: .post, parameters: ["email": cafe_model.email, "password": cafe_model.password, "phone_number": cafe_model.phone_number, "university": cafe_model.university, "company_name": cafe_model.company_name, "location_info": cafe_model.location_info], encoder:  JSONParameterEncoder.default).validate(contentType: ["application/json"]).responseJSON { response in
                debugPrint(response)
        }
    }
    
    //MARK: AUTHENTICATE
    
    func authenticate(email: String, password: String){
        myGroup.enter()
        let URL = "https://runnin21.herokuapp.com/authenticate"
    
        AF.request(URL, method: .post, parameters: ["email": email, "password": password], encoder: JSONParameterEncoder.default).validate(contentType: ["application/json"]).responseJSON { response in
            debugPrint(response)
            if (response.description.contains("Authetication Failed")){
                self.auth = 2
            }
            else {
                self.auth = 1
                let result = response.description
                let array = result.components(separatedBy: "(")
                let array2 = array[1].components(separatedBy: ")")
                print(array2[0])
                cafe.company_name = array2[0]
                self.getMenu(cafe: cafe)
                self.getCafe(cafe_model: cafe)
            }
            print("Finished request authentication")
            self.myGroup.leave()
        }
    }
    
    //MARK: MENU REQUESTS
    
    func getMenu(cafe: CafeModel){
        
        let URL = "https://runnin21.herokuapp.com/menu/" + cafe.company_name
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            print(json)
            for i in 0..<json.count{
                prod.product_id = json[String(i)]["product_id"].description
                prod.product_name = json[String(i)]["product_name"].description
                prod.price = json[String(i)]["price"].description
                prod.product_description = json[String(i)]["product_description"].description
                menuProducts.append(prod)
            }
        }
    }
    
    func menuAdd(name: String, product: Product) { 
        
        let URL = "https://runnin21.herokuapp.com/menu/" + cafe.company_name
        
        AF.request( URL, method: .post, parameters: ["product_id": product.product_id, "product_name": product.product_name, "price": product.price, "product_description": product.product_description], encoder: JSONParameterEncoder.default).validate(contentType:  ["application/json"]).responseJSON { response in
                debugPrint(response)
        }
    }
    
    func menuDrop(cafe: CafeModel, name: String) {
        
        let URL = "https://runnin21.herokuapp.com/remmenu/" + cafe.company_name
        
        AF.request( URL, method: .post, parameters: ["product_name": name], encoder: JSONParameterEncoder.default).validate(contentType:  ["application/json"]).responseJSON { response in
                debugPrint(response)
        }
    }
    
    //MARK: ORDER REQUESTS

    func getActiveOrders(cafe: CafeModel){
        myGroup.enter()
        self.getPreviousOrders(cafe: cafe)
        let URL = "https://runnin21.herokuapp.com/orderevent/" + cafe.company_name
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            print(json)
            for orders in 0..<json.count{
                var basket_total = 0.0
                order.id = String(orders)
                order.orderNo = String(orders + 1)
                for i in 0..<json[orders].count {
                    if i == 0 {
                        order.customer.username = json[orders][i].description
                    }
                    else if i == 1{
                        order.time = json[orders][i].description
                    }
                    else {
                    order.description.append(json[orders][i]["product_name"].description)
                    basket_total += Double(json[orders][i]["price"].description) ?? 0.0
                    }
                }
                order.total = String(basket_total)
                orderList.append(order)
                order.description.removeAll()
            }
            print("Finished request getActiveOrders")
            self.myGroup.leave()
        }
    }

    func orderReady(cafe: CafeModel, customer_name: String){  // NOT WORKING
        
        let URL = "https://runnin21.herokuapp.com/orderready/" + customer_name
        AF.request( URL, method: .post, parameters: ["company_name": cafe.company_name], encoder: JSONParameterEncoder.default).validate(contentType:  ["application/json"]).responseJSON { response in
            debugPrint(response)
        }
    }
    func getPreviousOrders(cafe: CafeModel){
        
        let URL = "https://runnin21.herokuapp.com/orderready/" + cafe.company_name
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            print(json)
            for orders in 0..<json.count{
                var basket_total = 0.0
                order.id = String(orders)
                order.orderNo = String(orders + 1)
                for i in 0..<json[orders].count {
                    if i == 0 {
                        order.customer.username = json[orders][i].description
                    }
                    else if i == 1{
                        order.time = json[orders][i].description
                    }
                    else {
                    order.description.append(json[orders][i]["product_name"].description)
                    basket_total += Double(json[orders][i]["price"].description) ?? 0.0
                    }
                }
                order.total = String(basket_total)
                previousList.append(order)
                order.description.removeAll()
            }
        }
    }
    
    func timeSlot(cafe: CafeModel, limit: String, opening: String, closing: String){
        
        let URL = "https://runnin21.herokuapp.com/timeslots/" + cafe.company_name
        AF.request( URL, method: .post, parameters: ["company_name": cafe.company_name, "opening_hour": opening, "closing_hour": closing, "limit": limit], encoder: JSONParameterEncoder.default).validate(contentType:  ["application/json"]).responseJSON { response in
            debugPrint(response)
        }
    }

}
 






