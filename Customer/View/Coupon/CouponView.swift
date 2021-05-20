//
//  CouponView.swift
//  swiftUIproject
//
//  Created by aslyy on 3.05.2021.
//

import SwiftUI

struct CouponView: View {

    let coupon: Coupon
    
    @State private var isAnimating: Bool = false
    
    
    var body: some View {
      ZStack {
        VStack(spacing: 20) {

            Image(coupon.image)
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
            .scaleEffect(isAnimating ? 1.0 : 0.6)
          

            Text(coupon.title)
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
          
          
          //ACTIVATE TO CAMPAIGN
            Button(action: {
              //ACTION WILL ACTIVATE BUTTON
            }) {
              HStack(spacing: 8) {
                Text("Activate")
                
                Image(systemName: "arrow.right.circle")
                  .imageScale(.large)
              }
              .padding(.horizontal, 16)
              .padding(.vertical, 10)
              .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
              )
            }
            .accentColor(Color.white)
            //
            
        }
      }
      .onAppear {
        withAnimation(.easeOut(duration: 0.5)) {
          isAnimating = true
        }
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(LinearGradient(gradient: Gradient(colors: [Color("ColorStrawberryLight"), Color("ColorStrawberryDark")]), startPoint: .top, endPoint: .bottom))
      .cornerRadius(20)
      .padding(.horizontal, 20)
    }
  }

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        CouponView(coupon: coupons[0])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
