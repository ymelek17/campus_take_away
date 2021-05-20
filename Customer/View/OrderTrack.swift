//
//  SwiftUIView.swift
//  swiftUIproject
//
//  Created by aslyy on 18.05.2021.
//

import SwiftUI

var isOrderReceived: Bool = false
var isOrderProcessed: Bool = false
var isOrderReady: Bool = false

struct OrderTrack: View {
    @State private var orderReceived: String = "Order Receieved"
    @State private var orderProcessed: String = "Your Order is Being Processed"
    @State private var orderReady: String = "Ready to Pickup"
    
    //burdaki booleanların güncellenmesiyle statu değişir
    
    var body: some View {
        
        if (isOrderReceived==true){
            //STATUS 1
            HStack {
              Text("Your Order \nStatus".uppercased())
                .statusLabelStyle()
                .multilineTextAlignment(.trailing)
              Spacer()
              Text("\(orderReceived)")
                .statusTypeStyle()
                .modifier(StatusModifier())
            }
            .modifier(OrderReceivedModifier())
        }
        
        else if(isOrderProcessed==true){
            //STATUS 2
            VStack{
                HStack {
                  Text("Your Order \nStatus".uppercased())
                    .statusLabelStyle()
                    .multilineTextAlignment(.trailing)
                    Spacer()
                  Text("\(orderProcessed)")
                    .statusTypeStyle()
                    .modifier(StatusModifier())
                }
            }
            .modifier(OrderProcessedModifier())
            
            
        }
        
        else if(isOrderReady==true){
            //STATUS 3
            HStack {
              Text("Your Order \nStatus".uppercased())
                .statusLabelStyle()
                .multilineTextAlignment(.trailing)
              Spacer()
              Text("\(orderReady)")
                .statusTypeStyle()
                .modifier(StatusModifier())
            }
            .modifier(OrderReadyModifier())
        }
        
        
    }
}

struct OrderTrack_Previews: PreviewProvider {
    static var previews: some View {
        OrderTrack()
    }
}

struct OrderReceivedModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.vertical, 4)
      .padding(.horizontal, 25)
      .frame(minWidth: 128)
      .background(
        Capsule()
            .foregroundColor(Color("ColorBlueberryDark").opacity(0.85))
            .padding(.horizontal, 10)
      )
  }
}

struct OrderProcessedModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.vertical, 4)
      .padding(.horizontal, 25)
      .frame(minWidth: 128)
      .background(
        Capsule()
            .foregroundColor(Color("ColorLemonDark").opacity(0.85))
            .padding(.horizontal, 10)
      )
  }
}

struct OrderReadyModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.vertical, 4)
      .padding(.horizontal, 25)
      .frame(minWidth: 128)
      .background(
        Capsule()
            .foregroundColor(Color("ColorCherryDark").opacity(0.85))
            .padding(.horizontal, 10)
      )
  }
}

struct StatusModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .shadow(color: Color("ColorTransparentBlack"), radius: 0, x: 0, y: 3)
      .layoutPriority(1)
  }
}

extension Text {
  func statusLabelStyle() -> Text {
    self
      .foregroundColor(Color.black)
      .font(.system(size: 10, weight: .bold, design: .rounded))
  }
  
  func statusTypeStyle() -> Text {
    self
      .foregroundColor(Color.black)
        .font(.system(.body, design: .rounded))
        .fontWeight(.regular)
  }
}

