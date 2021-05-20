//
//  ConfirmView.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 14.04.2021.
//

import SwiftUI

struct toBasketButton: View {
    
    @State private var toBasket = false
    @ObservedObject var requests = Requests()
    @EnvironmentObject var basketInfo: BasketInfo
    @State var time = ""
    var body: some View {
        
        HStack {
          Spacer()
            Button(action: {
                requests.getBasket(customer: user)
                requests.myGroup.notify(queue: DispatchQueue.main, execute: {
                    basketInfo.basketProducts.append(contentsOf: basketList)
                    basketInfo.time_slot = selected_timeslot
                    basketInfo.basket_total = basketTotal
                 //   basketInfo.timeslots_list.remove(at: selected_index)
                      //  if cafe.timeslots[selected_index] == "0"{
                        //    cafe.timeslots.remove(at: selec)
                        //    basketInfo.timeslots.remove(at: selected_index)
                          //  print(selected_timeslot, "selected index: ", selected_index)
                        //}
                    toBasket = true
                })
            }, label:{
                Text("Add to Basket")
                    .foregroundColor(Color.white)
                    .font(.system(.callout, design: .serif))
                    .fontWeight(.bold)
                    .shadow(radius: 3)
                    .padding(.vertical)
                    .padding(.horizontal, 0)
                    .frame(width: 185)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color("blue"))
                            .shadow(color: Color("blue"), radius: 6, x: 0, y: 6))
                })
            .edgesIgnoringSafeArea(.all)
        }.sheet(isPresented: self.$toBasket) {
            BasketView(productsBasket: BasketInfo().basketProducts, time_slot: time)
        }
    }
}

struct toBasketButton_Previews: PreviewProvider {
    static var previews: some View {
        toBasketButton(time: "")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
