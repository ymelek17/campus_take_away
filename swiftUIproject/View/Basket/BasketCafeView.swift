//
//  BasketCafeView.swift
//  swiftUIproject
//
//  Created by Yasemin Melek on 10.04.2021.
//

import SwiftUI

struct BasketCafeView: View {
    
    let brand: Brand

    var body: some View {
        HStack(alignment: .center, spacing: 10, content: {
            Image(brand.image)
              .resizable()
              .scaledToFit()
              .frame(width: 100, height: 100, alignment: .center)
            Spacer()
            Text(brand.name)
              .font(.title)
            .fontWeight(.bold).foregroundColor(.black)
        }).padding()
        .background(
            RoundedRectangle(cornerRadius: 2)
                .fill(Color("babyblue"))
                .shadow(color: Color("ColorBlackTransparentLight"), radius: 3, x: 0, y: 6))

        }
    }


struct BasketCafeView_Previews: PreviewProvider {
    static var previews: some View {
        BasketCafeView(brand: brands[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
