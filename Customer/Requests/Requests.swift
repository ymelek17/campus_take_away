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
        
    init() {    }

    var myGroup = DispatchGroup()
    var myGroup1 = DispatchGroup()
    var auth = 0
    var menu_request_done = [""]
    @EnvironmentObject var basketInfo: BasketInfo

    //MARK:  USER REQUESTS
    
    func getUser(username: String){
        
        let URL = "https://runnin21.herokuapp.com/user/" + username
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            print(json)
            user.first_name = json["first_name"].description
            user.last_name = json["last_name"].description
            user.email = json["email"].description
            user.date_of_birth = json["date_of_birth"].description
            user.password = json["password"].description
            user.phone_number = json["phone_number"].description
            user.university = json["university"].description
            user.gender = json["gender"].description
            if !json["Pending Orders"].description.isEmpty {
                order.id = "1"
                order.cafe = json["Pending Orders"][0].description
                order.time = json["Pending Orders"][1].description
                for i in 0..<json["Pending Orders"].count {
                    if (i != 0 || i != 1){
                        order.description.append(Product(product_id: json["Pending Orders"][i]["product_id"].description, product_name: json["Pending Orders"][i]["product_name"].description, price: json["Pending Orders"][i]["price"].description, product_description: json["Pending Orders"][i]["product_description"].description, product_cafe: order.cafe))
                        isOrderProcessed = true
                    }
                }
                print(order.cafe)
                if(isOrderProcessed){
                    user.pending_order.append(order)
                }
                order.description.removeAll()
            }
            for j in 0..<json["Order History"].count {
                order.id = String(j + 3)
                order.cafe = json["Order History"][j][0].description
                order.time = json["Order History"][j][1].description
                for k in 2..<json["Order History"][j].count {
                    order.description.append(Product(product_id: json["Order History"][j][k]["product_id"].description, product_name: json["Order History"][j][k]["product_name"].description, price: json["Order History"][j][k]["price"].description, product_description: json["Order History"][j][k]["product_description"].description, product_cafe: order.cafe))
                }
               // print(order.description)
                user.order_history.append(order)
                order.description.removeAll()
            }
            print(user.first_name + user.last_name)
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
                user.username = array2[0]
                self.getUser(username: user.username)
            }
            print("Finished request authentication " + user.username)
            self.myGroup.leave()
        }
    }
    
    func getCafe(name: String){
        if (!menu_request_done.contains(name)){
            myGroup.enter()
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
          //      cafe.opening_hour = json["Opening Hour"].description
          //      cafe.closing_hour = json["Closing Hour"].description
                for j in 1..<json["Timeslots"].count + 1{
                    cafe.timeslots[timeslotMap[j]!] = Int((json["Timeslots"]["timeslot" + String(j)].description))
                }
                print(cafe.timeslots)
                self.myGroup.leave()
            }
        }
        else {
            return
        }
    }
    
    func getTimeSlots(name: String){
            myGroup.enter()
            let URL = "https://runnin21.herokuapp.com/getcafe/" + name
            AF.request(URL, method: .get).responseJSON { response in
                let result = response.data
                let json = JSON(result!)
                print(json)
                for j in 1..<json["Timeslots"].count + 1{
                 //   print("INSIDE TIMESLOT", (json["Timeslots"]["timeslot" + String(j)]))
                    if ((json["Timeslots"]["timeslot" + String(j)]) !=  0 || (json["Timeslots"]["timeslot" + String(j)].description
                    ) !=  "0"){
                        let array = timeslotMap[j]!.components(separatedBy: "-")
                        let time = array[0]
                        if(self.compareTime(dateAsString: time) == 1){
                            cafeList[name]!.timeslots[timeslotMap[j]!] = Int((json["Timeslots"]["timeslot" + String(j)].description))
                            cafeList[name]!.timeslot_keys.append(timeslotMap[j]!)
                        }
                    }
                }
                print(cafeList[name]!.timeslots)
                print(cafeList[name]!.timeslot_keys)
                self.myGroup.leave()
            }
        }
    
    func orderPickUp(customer: Customer){
        
        let URL = "https://runnin21.herokuapp.com/pickedup/" + customer.username
        AF.request(URL, method: .get).responseJSON { response in
                debugPrint(response)
        }
    }
    
    func getAllCafes(){
        myGroup1.enter()
        let URL = "https://runnin21.herokuapp.com/cafe/KocUniversity"
        AF.request(URL, method: .get).responseJSON { response in
            let result = response.data
            let json = JSON(result!)
            print(json)
            for i in 0..<json.count{
                cafe.company_name = json[String(i)]["company_name"].description
                self.getMenu(name: cafe.company_name)
                if(!user.pending_order.isEmpty){
                    if(cafe.company_name == user.pending_order[0].cafe){
                        if (json[String(i)]["Active Orders"][0].description == user.username){
                            isOrderProcessed = true
                        }
                        else {
                            isOrderReady = true
                            isOrderProcessed = false
                            self.orderPickUp(customer: user)
                        }
                    }
                }
                cafe.email = json[String(i)]["email"].description
                cafe.password = json[String(i)]["password"].description
                cafe.phone_number = json[String(i)]["phone_number"].description
                cafe.university = json[String(i)]["university"].description
                cafe.location_info = json[String(i)]["location_info"].description
                cafeList[cafe.company_name] = cafe
                for j in 1..<json[String(i)]["Timeslots"].count + 1{
                    if ((json["Timeslots"]["timeslot" + String(j)]) !=  0 || (json["Timeslots"]["timeslot" + String(j)].description) !=  "0") {
                        let array = timeslotMap[j]!.components(separatedBy: "-")
                        let time = array[0]
                        if(self.compareTime(dateAsString: time) == 1){
                            cafeList[cafe.company_name]!.timeslots[timeslotMap[j]!] = Int((json["Timeslots"]["timeslot" + String(j)].description))
                            cafeList[cafe.company_name]!.timeslot_keys.append(timeslotMap[j]!)
                        }
                    }
                }
                print(cafeList[cafe.company_name]!.timeslots)
                print(cafeList[cafe.company_name]!.timeslot_keys)
            }
            self.myGroup1.leave()
        }
    }
    
    func compareTime(dateAsString: String) -> Int{
        let current_date = Date()
        let calendar = Calendar.current
        let current_hour = calendar.component(.hour, from: current_date)
       // let current_minutes = calendar.component(.minute, from: current_date)
        let array = dateAsString.components(separatedBy: ".")
        if (Int(array[0])! > current_hour){
            return 1
        }
        else {
            return 1
        }
    }
    
    func getMenu(name: String){
    //    if (!menu_request_done.contains(name)){
            let URL = "https://runnin21.herokuapp.com/menu/" + name
            AF.request(URL, method: .get).responseJSON { response in
                let result = response.data
                let json = JSON(result!)
                print(json)
                for i in 0..<json.count{
                    prod.product_id = json[String(i)]["product_id"].description
                    prod.product_name = json[String(i)]["product_name"].description
                    prod.price = json[String(i)]["price"].description
                    prod.product_description = json[String(i)]["product_description"].description
                    prod.product_cafe = name
                    products.append(prod)
                }
                self.menu_request_done.append(name)
            }
     /*   }
        else {
            return
        }*/
    }
    
    
    //MARK: BASKET REQUESTS
    
    func getBasket(customer: Customer){
        myGroup.enter()
        let URL = "https://runnin21.herokuapp.com/basket/" + customer.username
        AF.request(URL, method: .get).responseJSON { [self] response in
            let result = response.data
            let json = JSON(result!)
            for i in 0..<json.count{
                prod.product_id = json[String(i)]["product_id"].description
                prod.product_name = json[String(i)]["product_name"].description
                prod.price = json[String(i)]["price"].description
                prod.product_description = json[String(i)]["product_description"].description
                basketTotal += Double(prod.price) ?? 0.0
                basketList.append(prod)
            }
            print(basketList)
            self.myGroup.leave()
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
    
    func orderEvent(name: String, customer: Customer, time: String){
        
        let URL = "https://runnin21.herokuapp.com/orderevent/" + name
        AF.request( URL, method: .post, parameters: ["username": customer.username, "timeslot": time], encoder: JSONParameterEncoder.default).validate(contentType:  ["application/json"]).responseJSON { response in
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
 





