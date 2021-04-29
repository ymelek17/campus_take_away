//
//  SPLogin.swift
//  swiftUIproject
//
//  Created by aslyy on 15.04.2021.
//

import SwiftUI

struct SPLogin: View {
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode


    @State private var email: String = ""
    @State private var password: String = ""


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

            
        }
            
            

        Group {
            
            Spacer()
           //READY
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
                //WHEN CLICK ON LOGIN ---> ACTION GOES HERE
                return
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
                  .background(
                      RoundedRectangle(cornerRadius: 12)
                          .fill(LinearGradient(gradient: Gradient(colors: [Color("blue"), Color("blue")]), startPoint: .top, endPoint: .bottom))
                          .shadow(color: Color("blue"), radius: 6, x: 0, y: 6)
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

struct SPLogin_Previews: PreviewProvider {
    static var previews: some View {
        SPLogin()
    }
}
