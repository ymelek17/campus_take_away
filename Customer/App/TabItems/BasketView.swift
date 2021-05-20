//
//  BasketView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct BasketView: View {
    @ObservedObject var requests = Requests()
    @State private var backtoMenu = false
    @State private var emptyBasket = false
    @EnvironmentObject var basketInfo: BasketInfo
    
    var productsBasket: [Product]
    var time_slot: String


    var body: some View {
    VStack {
        //MARK: Navbar
        HStack {
           /* Button(action: {
                backtoMenu = true
            }, label: {
            Image(systemName: "chevron.left")
              .font(.title)
              .foregroundColor(.white)
          })
            .sheet(isPresented: self.$backtoMenu) {
                RestaurantMenuView()
          }
          */
          Spacer()
          
          Button(action: {
            emptyBasket = true
            requests.emptyBasket(customer: user)
          }, label: {
            Image(systemName: "trash")
              .font(.title)
              .foregroundColor(.white)
          })
          .sheet(isPresented: self.$backtoMenu) {
           // BasketView(product: product)
        }
        }
        .padding()
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        .background(Color("ColorBlackTransparentLight"))
        
        
        ScrollView(.vertical, showsIndicators: false, content: {

        HStack {
            //MARK: Header
            Text("My Basket").font(.largeTitle)
                .foregroundColor(Color("DarkBlue"))
                .fontWeight(.black)
                .font(.system(.title, design: .serif))
                .padding()
            
              Spacer()
              Button(action: {
                emptyBasket = true
                requests.emptyBasket(customer: user)
                basketInfo.basketProducts.removeAll()
                basketInfo.basket_total = 0.0
              }, label: {
                Image(systemName: "trash")
                  .font(.title)
                  .foregroundColor(.gray)
              })
            }
            .padding()
            .background(Color("ColorBlackTransparentLight"))
            
            if(basketInfo.basket_confirmed == true) {
                OrderTrack()
            }
        //MARK: Restaurant
        BasketCafeView(brand: brands[0])
        
        //MARK: Products, Time Slot, Confirm
            if emptyBasket == false {
                VStack {
                    ForEach(productsBasket) { product in
                        ProductsBasketView(product: product).padding()
                        Spacer()
                    }
                    Text("Selected Time Slot: " + time_slot).font(.title3).fontWeight(.bold).foregroundColor(.black)
                        .font(.system(.callout, design: .serif))
                        .padding()
                    Text("Basket Total: " + String(basketInfo.basket_total) + "TL").font(.title3).fontWeight(.bold).foregroundColor(.black)
                        .font(.system(.callout, design: .serif))
                        .padding()
                    
                    ConfirmView()
                    .padding(15)
                    .padding(.bottom)
                    .background(Color("ColorBlackTransparentLight"))
                  }
            }
            else {
            Text("Basket is empty").font(.title3).fontWeight(.bold).foregroundColor(.black)
                .font(.system(.callout, design: .serif))
                .padding()
            }
        })

    }.zIndex(0)
    .ignoresSafeArea(.all, edges: .top)
    .background(Color(.white).ignoresSafeArea(.all, edges: .all))
        
    }
}


struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(productsBasket: [], time_slot: "")
            .previewLayout(.device)
    }
}

