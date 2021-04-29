//
//  NavigationBarMenuView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct NavigationBarMenuView: View {

  @EnvironmentObject var menu: Menu
    @State private var toBasket = false
    @ObservedObject var requests = Requests()
  
  var body: some View {
    HStack {
      Button(action: {
        withAnimation(.easeIn) {

          menu.selectedBrand = nil
          menu.showingBrand = false
        }
      }, label: {
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      })
      
      Spacer()
      
        Button(action: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                toBasket = true
            }
        }, label: {
          Image(systemName: "cart")
            .font(.title)
            .foregroundColor(.white)
        }).sheet(isPresented: self.$toBasket) {
              BasketView()
        }
    } //: HSTACK
  }
}



struct NavigationBarMenuView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBarMenuView()
      .environmentObject(Menu())
      .previewLayout(.sizeThatFits)
      .padding()
      .background(Color.gray)
  }
}
