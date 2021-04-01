//
//  SettingsView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct SettingsView: View {
    @State private var enableNotification: Bool = true

    
    var body: some View {
      VStack(alignment: .center, spacing: 0) {
        // MARK: - HEADER
        VStack(alignment: .center, spacing: 5) {
          Image("logo")
            .resizable()
            .scaledToFit()
            .padding(.top)
            .frame(width: 150, height: 150, alignment: .center)
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 4)
          
        }
        .padding()
        
        Form {
            // MARK:
            Section(header: Text("Account Settings")) {
                
            Text("Personal Info")
            Text("Cart Info")
            Text("My Order History")
            
            }
            
          // MARK:
          Section(header: Text("General Settings")) {
            Toggle(isOn: $enableNotification) {
              Text("Enable notification")
            }
            
          }
          
          // MARK:
          Section(header: Text("Application")) {
              HStack {
                Text("Product").foregroundColor(Color.gray)
                Spacer()
                Text("Buy & Run")
              }

              HStack {
                Text("Developer").foregroundColor(Color.gray)
                Spacer()
                Text("Bitirim")
              }
          
              HStack {
                Text("Website").foregroundColor(Color.gray)
                Spacer()
                Text("buyandrun.com")
              }
              HStack {
                Text("Version").foregroundColor(Color.gray)
                Spacer()
                Text("1.0.0")
              }
           
          }
        }
      }
      .frame(maxWidth: 640)
    }
  }

  struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
      SettingsView()
    }
  }
