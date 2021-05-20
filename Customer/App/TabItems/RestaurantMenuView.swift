//
//  RestaurantMenuView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct RestaurantMenuView: View {

  
  @EnvironmentObject var menu: Menu
  @EnvironmentObject var basket: BasketInfo
  @ObservedObject var requests = Requests()
  @State var time = ""
  @State var cafe_name = ""
  @State var goBack = false
    
  var body: some View {
    VStack(alignment: .leading, spacing: 5, content: {

        HStack {
          Button(action: {
            withAnimation(.easeIn) {
              menu.selectedBrand = nil
              menu.showingBrand = false
              goBack = true
            }
          }, label: {
            Image(systemName: "chevron.left")
              .font(.title)
              .foregroundColor(.white)
          }).sheet(isPresented: self.$goBack) {
            ContentView()
          }
            
          
          Spacer()
        }.padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        
        Text(" ").font(.title)
        Text(" ").font(.title)

        HeaderDetailView(cafe_header: cafe_name)
        .padding(.horizontal)
        .zIndex(1)
        
        Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        

      VStack(alignment: .center, spacing: 0, content: {
        
        
        
        // DESCRIPTION
        ScrollView(.vertical, showsIndicators: false, content: {
            
            RatingView()
              .padding(.bottom, 10)
            
            TimeSlot(cafe_model: cafeList[cafe_name]!)
                
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

            Text("MENU").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.black).foregroundColor(.blue)
            
            VStack(alignment: .leading){
              ForEach(products) { product in
                if(product.product_cafe == cafe_name){
                    ProductOnListView(product: product).padding(10)
                }
              }.padding(.leading, 5)
            }
            
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            toBasketButton(time: time).padding(15)
            
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
        }) //: SCROLL
        

      })
      .padding(.horizontal)
      .background(
        Color.white
          .clipShape(CustomShape())
          .padding(.top, -35)
      )
    }) //: VSTACK
    .zIndex(0)
    .ignoresSafeArea(.all, edges: .top)
    .background(
        Color(.gray
      ).ignoresSafeArea(.all, edges: .all)
    )
}
}

struct RestaurantMenuView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantMenuView(cafe_name: "")
      .environmentObject(Menu())
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
