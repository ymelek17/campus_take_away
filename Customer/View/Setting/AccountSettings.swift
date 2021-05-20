//
//  AccountSettings.swift
//  swiftUIproject
//
//  Created by aslyy on 3.05.2021.
//

import SwiftUI

struct AccountSettings: View {

    
    @State var nameInEditMode = false
    @State var first_name = user.first_name
    @State var last_name = user.last_name
    @State var email = user.email
    @State var phone = user.phone_number
    @State var university = user.university
    
    
    var body: some View {

            Form {
            Section(header: Text("Account Settings")) {
                  
                  if nameInEditMode {
                      TextField("Enter First Name:", text: $first_name)
                          .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                          .autocapitalization(.words)
                          .disableAutocorrection(true)
                      TextField("Enter Last Name:", text: $last_name)
                          .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                          .autocapitalization(.words)
                          .disableAutocorrection(true)
                      TextField("Enter New Email:", text: $email)
                          .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                          .autocapitalization(.words)
                          .disableAutocorrection(true)
                      TextField("Enter New Phone Number:", text: $phone)
                          .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                          .autocapitalization(.words)
                          .disableAutocorrection(true)
                      TextField("Enter New University:", text: $university)
                          .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                          .autocapitalization(.words)
                          .disableAutocorrection(true)
                  } else {
                      Text("First Name: " + first_name)
                      Text("Last Name: " + last_name)
                      Text("Email: " + email)
                      Text("Phone: " + phone)
                      Text("University: " + university)
                  }
                  
                  Button(action: {
                    // ACTION
                      if(first_name == "" || last_name == "" || email == "" || phone == "" || university == ""
                          ){
                         return
                      } else {
                          self.nameInEditMode.toggle()
                      }
                  }, label: {
                      if nameInEditMode {
                          HStack(alignment: .center, spacing: 5) {
                          Text("> Save Changes")
                              .foregroundColor(Color("DarkBlue"))
                              .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                          Image(systemName: "lock.open.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("DarkBlue"))
                          }

                      } else {
                          HStack(alignment: .center, spacing: 5) {
                          Text("> Edit Profile Info")
                              .foregroundColor(Color("DarkBlue"))
                              .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                          Image(systemName: "lock.fill").resizable().frame(width: 16, height: 20).foregroundColor(Color("DarkBlue"))
                          }
                      }

                  })
              
            }
              

            
            }

    }
}

struct AccountSettings_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettings()
    }
}
