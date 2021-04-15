//
//  RestaurantMenuView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct RestaurantMenuView: View {

  
  @EnvironmentObject var menu: Menu
  
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5, content: {

        NavigationBarMenuView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

        HeaderDetailView()
        .padding(.horizontal)
        .zIndex(1)
        
        Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        

      VStack(alignment: .center, spacing: 0, content: {
        
        
        
        // DESCRIPTION
        ScrollView(.vertical, showsIndicators: false, content: {
            
            RatingView()
              .padding(.bottom, 10)
            
            TimeSlot()
                
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

            Text("MENU").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.black).foregroundColor(.blue)
            
            VStack(alignment: .leading){
              ForEach(products) { product in
                ProductOnListView(product: product).padding(10)
                  
              }.padding(.leading, 5)
            }
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
    .ignoresSafeArea(.all, edges: .all)
    .background(
        Color(.gray
      ).ignoresSafeArea(.all, edges: .all)
    )
  }
}


struct RestaurantMenuView_Previews: PreviewProvider {
  static var previews: some View {
    RestaurantMenuView()
      .environmentObject(Menu())
      .previewLayout(.fixed(width: 375, height: 812))
  }
}
