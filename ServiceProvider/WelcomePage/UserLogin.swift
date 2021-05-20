//
//  UserLogin.swift
//  swiftUIproject
//
//  Created by aslyy on 15.04.2021.
//

import SwiftUI

struct UserLogin: View {
    
        @ObservedObject var requests = Requests()
        @State private var isShowingMainView = false
        @State private var pulsate: Bool = false
        @Environment(\.presentationMode) var presentationMode
        
        @State private var email: String = ""
        @State private var password: String = ""


        @State private var errorshowing: Bool = false
        @State private var errortitle: String = ""
        @State private var errormsg: String = ""

        
        var body: some View {
          NavigationView {
            VStack(alignment: .center, spacing: 5) {

                
            Group {
                
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

            
                Text(" ")
               
                //READY
                VStack {
                    Button(action: { 
                     // ACTION
                     if
                         self.password == "" ||
                         self.email == ""
                     {
                             self.errorshowing=true
                             self.errortitle = "Invalid entry"
                             self.errormsg = "Enter all values as requested."
                             return

                     } else {
                        requests.authenticate(email: self.email, password: self.password)
                        requests.myGroup.notify(queue: DispatchQueue.main, execute: {
                            print("Finished authentication.")
                            if requests.auth == 1{
                                self.isShowingMainView = true
                            }
                            return
                        })
                     }
                    },
                    label: {
                         Text("Login")
                             .foregroundColor(Color.white)
                             .font(.system(.callout, design: .serif))
                             .fontWeight(.bold)
                             .shadow(radius: 3)
                             .padding(.vertical)
                             .padding(.horizontal, 0)
                             .frame(width: 185)
                             .background(RoundedRectangle(cornerRadius: 12)
                                     .fill(LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("blue")]), startPoint: .top, endPoint: .bottom))
                                     .shadow(color: Color("blue"), radius: 6, x: 0, y: 6)
                               )

                       })

                }
                

                  //END SAVE BUTTON
                Spacer()
                
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

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 185)
            .font(.system(.title3, design: .serif))
            .background(RoundedRectangle(cornerRadius: 12)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("blue")]), startPoint: .top, endPoint: .bottom))
                            .shadow(color: Color("blue"), radius: 6, x: 0, y: 6))
            .foregroundColor(.white)
            .shadow(radius: 5)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)

    }
}

struct UserLogin_Previews: PreviewProvider {
    static var previews: some View {
        UserLogin()
    }
}
