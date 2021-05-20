//
//  WelcomeView.swift
//  swiftUIproject
//
//  Created by aslyy on 15.04.2021.
//

import SwiftUI

struct WelcomeView: View {
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showModel1: Bool = false
    @State private var showModel2: Bool = false
    @State private var showModel3: Bool = false
    @State private var showModel4: Bool = false
    
    var body: some View {
    NavigationView {
    VStack(alignment: .center, spacing: 5) {
        //BUY&RUN LOGO
        Image("logo")
            .resizable()
            .frame(width: 300, height: 300)
            .padding(.bottom, -90)
            .padding(.top, -20)
        
        VStack(alignment: .leading, spacing: 30) {
            
            //USER ICON
                Image("user")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, -63)
                    .padding(.top, -20)
            
            //USER LOGIN START
          HStack(alignment: .center, spacing: 5) {
            Image(systemName: "greaterthan.square.fill")
              .resizable()
              .scaledToFit()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .background(Circle().fill(Color("ColorBase")))
              .frame(width: 30, height: 30, alignment: .center)
            Text("Login")
                .font(.title3).fontWeight(.black).foregroundColor(.blue)
          }
          .background(Color.white)
          .cornerRadius(12)
          .onTapGesture {
            self.hapticImpact.impactOccurred()
            self.showModel1 = true
          }
          .sheet(isPresented: self.$showModel1) {
            UserLogin()
          }
            //USER LOGIN ENDS
            
            //USER SIGNUP START
            HStack(alignment: .center, spacing: 5) {
              Image(systemName: "greaterthan.square.fill")
                .resizable()
                .scaledToFit()
                  .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                  .background(Circle().fill(Color("ColorBase")))
                .frame(width: 30, height: 30, alignment: .center)
             Text("Sign Up")
                .font(.title3).fontWeight(.black).foregroundColor(.blue)

            }
            .background(Color.white)
            .cornerRadius(12)
            .onTapGesture {
              self.hapticImpact.impactOccurred()
              self.showModel3 = true
            }
            .sheet(isPresented: self.$showModel3) {
              UserSignUp()
            }
            //USER SIGNUP ENDS
        }
        
        
        VStack(alignment: .leading, spacing: 30) {
            
        //SP ICON
            Image("serviceprovider")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.bottom, -70)
         
            NavigationLink(
                destination: SPLogin().navigationBarBackButtonHidden(true).navigationBarHidden(true),
                label: {
                    HStack(alignment: .center, spacing: 5) {
                      Image(systemName: "greaterthan.square.fill")
                        .resizable()
                        .scaledToFit()
                          .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                          .background(Circle().fill(Color("ColorBase")))
                        .frame(width: 30, height: 30, alignment: .center)
                      Text("Login")
                          .font(.title3).fontWeight(.black).foregroundColor(.blue)
                    }
                })
        //SP LOGIN START
    /*    HStack(alignment: .center, spacing: 5) {
          Image(systemName: "greaterthan.square.fill")
            .resizable()
            .scaledToFit()
              .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
              .background(Circle().fill(Color("ColorBase")))
            .frame(width: 30, height: 30, alignment: .center)
          Text("Login")
            .font(.title3).fontWeight(.black).foregroundColor(.blue)
        }
        .background(Color.white)
        .cornerRadius(12)
        .onTapGesture {
          self.hapticImpact.impactOccurred()
          self.showModel2 = true
        }
        .sheet(isPresented: self.$showModel2) {
          SPLogin()
        }*/
        //SP LOGIN ENDS
    
            
        //SP SIGNUP START
        HStack(alignment: .center, spacing: 5) {
          Image(systemName: "greaterthan.square.fill")
            .resizable()
            .scaledToFit()
              .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
              .background(Circle().fill(Color("ColorBase")))
            .frame(width: 30, height: 30, alignment: .center)
          Text("Sign Up")
            .font(.title3).fontWeight(.black).foregroundColor(.blue)
        }
        .background(Color.white)
        .cornerRadius(12)
        .onTapGesture {
          self.hapticImpact.impactOccurred()
          self.showModel4 = true
        }
        .sheet(isPresented: self.$showModel4) {
          SPSignUp()
        }
        //SP SIGNUP ENDS
        }
   

        
        

    }
}.navigationBarTitle("", displayMode: .inline)
    .navigationBarHidden(true).navigationBarHidden(true).navigationBarBackButtonHidden(true)
}
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
