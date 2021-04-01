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
      // NAVBAR
        NavigationBarMenuView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)

      // HEADER
      HeaderDetailView()
        .padding(.horizontal)
      
      // DETAIL TOP PART
      TopPartDetailView()
        .padding(.horizontal)
        .zIndex(1)
      

      VStack(alignment: .center, spacing: 0, content: {
        
        RatingView()
          .padding(.top, -20)
          .padding(.bottom, 10)
        
        // DESCRIPTION
        ScrollView(.vertical, showsIndicators: false, content: {
          
        }) //: SCROLL
        

      }) //: VSTACK
      .padding(.horizontal)
      .background(
        Color.white
          .clipShape(CustomShape())
          .padding(.top, -105)
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
