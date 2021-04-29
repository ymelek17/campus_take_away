//
//  UserSignUp.swift
//  swiftUIproject
//
//  Created by aslyy on 15.04.2021.
//

import SwiftUI

struct UserSignUp: View {
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode

    
    @State private var first_name: String = ""
    @State private var last_name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var phoneNumber: String = ""
    @State private var dateOfBirth: String = ""
    @State private var university: String = ""
    @State private var position: String = ""
    @State private var gender: String = ""
    
    @State private var isEditing = false

    @State private var errorshowing: Bool = false
    @State private var errortitle: String = ""
    @State private var errormsg: String = ""

    
    var body: some View {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(alignment: .center, spacing: 0) {
            
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(" ").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
          
        Group {
            
            //-----first name------
            TextField("Enter First Name", text: $first_name)
            .frame(width: 300.0, height: 15.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)

            Spacer()
            //-----last name------
            TextField("Enter Last Name", text: $last_name)
            .frame(width: 300.0, height: 15.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            
            Spacer()
            //-----email-----
            TextField("Enter Email", text: $email)
            .frame(width: 300.0, height: 15.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
                
            
            Spacer()
            //-----password------
            TextField("Enter Password", text: $password)
            .frame(width: 300.0, height: 15.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)

            Spacer()
            //-----confirm password------
            TextField("Confirm Password", text: $confirmPassword)
            .frame(width: 300.0, height: 15.0)
            .autocapitalization(.none)
            .disableAutocorrection(true)
            //.border(Color(UIColor.separator))
            .font(.headline)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            Spacer()
            
        }
            
            
            Group {
                
                //-----phoneNumber-----
                TextField("Enter Phone Number", text: $phoneNumber)
                .frame(width: 300.0, height: 15.0)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                //.border(Color(UIColor.separator))
                .font(.headline)
                .padding()
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(9)

                Spacer()
                //-----dateOfBirth------
                TextField("Enter Date of Birth", text: $dateOfBirth)
                .frame(width: 300.0, height: 15.0)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                //.border(Color(UIColor.separator))
                .font(.headline)
                .padding()
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(9)

                
                Spacer()
                //-----university-----
                TextField("Select University", text: $university)
                .frame(width: 300.0, height: 15.0)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                //.border(Color(UIColor.separator))
                .font(.headline)
                .padding()
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(9)
                    
                
                Spacer()
                //-----position------
                TextField("Select Staff/Student", text: $position)
                .frame(width: 300.0, height: 15.0)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                //.border(Color(UIColor.separator))
                .font(.headline)
                .padding()
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(9)

                Spacer()
                //-----gender------
                TextField("Select Gender", text: $gender)
                .frame(width: 300.0, height: 15.0)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                //.border(Color(UIColor.separator))
                .font(.headline)
                .padding()
                .background(Color(UIColor.tertiarySystemFill))
                .cornerRadius(9)
                Spacer()
                
            }

        Group {
            
            Spacer()
           //READY
           Button(action: {
            // ACTION
            if self.first_name == "" ||
                self.last_name == "" ||
                self.password == "" ||
                self.confirmPassword == "" ||
                self.email == "" ||
                self.phoneNumber == "" ||
                self.dateOfBirth == "" ||
                self.university == "" ||
                self.position == "" ||
                self.gender == ""
            {
                    self.errorshowing=true
                    self.errortitle = "Invalid entry"
                    self.errormsg = "Enter all values as requested."
                    return

            } else {
                //WHEN CLICK ON LOGIN ---> ACTION GOES HERE
                return
            }
            
           },
           label: {
              Text("Sign Up")
                  .foregroundColor(Color.white)
                  .font(.system(.callout, design: .serif))
                  .fontWeight(.bold)
                  .shadow(radius: 3)
                  .padding(.vertical)
                  .padding(.horizontal, 0)
                  .frame(width: 185)
                  .background(
                      RoundedRectangle(cornerRadius: 12)
                          .fill(LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("purple")]), startPoint: .top, endPoint: .bottom))
                          .shadow(color: Color("purple"), radius: 6, x: 0, y: 6)
                    )
                  .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
              })
              //END SAVE BUTTON
            
          }
          .padding(.horizontal, 24)
          .padding(.vertical, 2)
        }
      }
      .edgesIgnoringSafeArea(.top)
      .overlay(
        HStack {
          Spacer()
          VStack {
            Button(action: {

              self.presentationMode.wrappedValue.dismiss()
            }, label: {
                
                 Image(systemName: "chevron.left.circle.fill")
                   .font(.title3)
                   .foregroundColor(.gray)
                   .shadow(radius: 1)
                    .opacity(self.pulsate ? 1 : 0.8)
                    .scaleEffect(self.pulsate ? 1.1 : 0.9, anchor: .center)
                   .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                   Text("Back")
                     .font(.title3)
                     .foregroundColor(.gray)
                     .shadow(radius: 1)

               })
               .padding(.trailing, 240)
                 .padding(.top, 20)
               .alert(isPresented: $errorshowing){
                   Alert(title: Text(errortitle),
                         message: Text(errormsg),
                         dismissButton: .default(Text("OK")))
               }
               Spacer()
          }
        }
      )
      .onAppear() {
        self.pulsate.toggle()
      }
    }
  }
struct UserSignUp_Previews: PreviewProvider {
    static var previews: some View {
        UserSignUp()
    }
}
