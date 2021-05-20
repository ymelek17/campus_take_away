//
//  Restaurant Status.swift
//  ServiceProvider14Ap
//
//  Created by aslyy on 29.04.2021.
//

import SwiftUI

struct RestaurantStatus: View {
    
    @State private var status: Bool = true
    
    var body: some View {
        Toggle(isOn: $status, label: {
            Image(systemName: "sun.haze")
                .resizable()
                .frame(width: 40, height: 40)
            Text("Open Your Restaurant")
                .font(.title2)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
        })
        .padding(.horizontal, 30.0)
        .toggleStyle(SwitchToggleStyle(tint: .blue))

    }
}

struct RestaurantStatus_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantStatus()
    }
}
