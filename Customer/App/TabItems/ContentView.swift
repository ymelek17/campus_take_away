//
//  ContentView.swift
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var menu: Menu
    @EnvironmentObject var basketInfo: BasketInfo
    @ObservedObject var requests = Requests()
    @State var cafe_name = ""
    
    var body: some View {
      ZStack {
        if menu.showingBrand == false && menu.selectedBrand == nil {
          VStack(spacing: 0) {
//            NavigationBarView()
//              .padding(.horizontal, 15)
//              .padding(.bottom)
//              .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//              .background(Color.white)
//              .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            ScrollView(.vertical, showsIndicators: false, content: {
              VStack(spacing: 0) {
                FeaturedTabView()
                  .padding(.vertical, 20)
                OrderTrack()
                CategoryGridView()
                
                LazyVGrid(columns: gridLayout, spacing: 15, content: {
                  ForEach(brands) { brand in
                    RestaurantsView(brand: brand)
                      .onTapGesture {
                            withAnimation(.easeOut) {
                                requests.getTimeSlots(name: brand.name)
                                requests.myGroup.notify(queue: DispatchQueue.main, execute: {
                                    print("getTimeSlots request complete")
                                    self.cafe_name = brand.name
                                    current_brand = brand.name
                                    menu.selectedBrand = brand
                                    menu.showingBrand = true
                                })
                            }
                        }
                      }
                })
                .padding(15)
                
                FooterView()
                  .padding(.horizontal)
              }
            })
            
          }
          .background(colorBackground.ignoresSafeArea(.all, edges: .all))
        } else {
            RestaurantMenuView(cafe_name: cafe_name)
        }
      }
      .ignoresSafeArea(.all, edges: .top)
    }
  }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
