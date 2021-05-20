//
//  BarView.swift
//  ServiceProvider14Ap
//
//  Created by asli on 1.05.2021.
//

import SwiftUI

struct BarView: View{

    var value: CGFloat
    var cornerRadius: CGFloat
    
    var body: some View {
        VStack {

            ZStack (alignment: .bottom) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 15, height: 10).foregroundColor(.white)

                RoundedRectangle(cornerRadius: cornerRadius).fill(LinearGradient(gradient: Gradient(colors: [.purple, .red, .blue]), startPoint: .top, endPoint: .bottom))
                .frame(width: 15, height: value)
                
            }.padding(.bottom, 8)
        }
        
    }
}


