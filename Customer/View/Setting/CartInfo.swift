//
//  CartInfo.swift
//  swiftUIproject
//
//  Created by aslyy on 3.05.2021.
//

import SwiftUI

struct CartInfo: View {

    
    @State var nameInEditMode = false
    @State var name = ""
    @State var card_no = ""
    
    
    var body: some View {

            Form {
            Section(header: Text("Card Settings")) {
                  
                  if nameInEditMode {
                      TextField("Enter Name on Card:", text: $name)
                          .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                          .autocapitalization(.words)
                          .disableAutocorrection(true)
                      TextField("Enter Card Number:", text: $card_no)
                          .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                          .autocapitalization(.words)
                          .disableAutocorrection(true)
                  } else {
                    Text("Name: " + user.first_name + " " + user.last_name)
                      Text("Card No: " + card_no)
                  }
                  
                  Button(action: {
                    // ACTION
                      if(name == "" || card_no == ""){
                         return
                      } else{
                          self.nameInEditMode.toggle()
                      }
                  }, label: {
                      if nameInEditMode {
                          HStack(alignment: .center, spacing: 5) {
                          Text("> Save Changes")
                              .foregroundColor(Color("DarkBlue"))
                              .fontWeight(.bold)
                          Image(systemName: "lock.open.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("DarkBlue"))
                          }

                      } else {
                          HStack(alignment: .center, spacing: 5) {
                          Text("> Edit Card Info")
                              .foregroundColor(Color("DarkBlue"))
                              .fontWeight(.bold)
                          Image(systemName: "lock.fill").resizable().frame(width: 16, height: 20).foregroundColor(Color("DarkBlue"))
                          }
                      }

                  })
              
            }
              

            
            }

    }
}

struct CartInfo_Previews: PreviewProvider {
    static var previews: some View {
        CartInfo()
    }
}
