import SwiftUI

struct SettingsView: View {
    @State private var enableNotification: Bool = true
    
    @State var nameInEditMode = false
    @State var company_name = cafe.company_name
    @State var working_hours = cafe.opening_hour + "-" + cafe.closing_hour
    @State var email = cafe.email
    @State var phone = cafe.phone_number
    @State var location = cafe.university
    
    
    var body: some View {
        //
        NavigationView {

                Form {
                Section(header: Text("")) {}
                Section(header: Text("Account Settings")) {
                      
                      if nameInEditMode {
                          TextField("Enter New Name:", text: $company_name)
                              .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                              .autocapitalization(.words)
                              .disableAutocorrection(true)
                          TextField("Enter New Name:", text: $working_hours)
                              .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                              .autocapitalization(.words)
                              .disableAutocorrection(true)
                          TextField("Enter New Name:", text: $email)
                              .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                              .autocapitalization(.words)
                              .disableAutocorrection(true)
                          TextField("Enter New Name:", text: $phone)
                              .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                              .autocapitalization(.words)
                              .disableAutocorrection(true)
                          TextField("Enter New Name:", text: $location)
                              .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.leading, 5)
                              .autocapitalization(.words)
                              .disableAutocorrection(true)
                      } else {
                          Text("Company: " + company_name)
                          Text("Working Hours: " + working_hours)
                          Text("Email: " + email)
                          Text("Phone: " + phone)
                          Text("Location: " + location)
                      }
                      
                      Button(action: {
                        // ACTION
                          if(company_name == "" || working_hours == "" || email == "" || phone == "" || location == ""
                              ){
                             return
                          } else {
                              self.nameInEditMode.toggle()
                          }
                      }, label: {
                          if nameInEditMode {
                              HStack(alignment: .center, spacing: 5) {
                              Text("> Save Changes")
                                  .foregroundColor(Color("Blue"))
                                  .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                              Image(systemName: "lock.open.fill").resizable().frame(width: 20, height: 20).foregroundColor(Color("Blue"))
                              }

                          } else {
                              HStack(alignment: .center, spacing: 5) {
                              Text("> Edit Profile Info")
                                  .foregroundColor(Color("Blue"))
                                  .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                              Image(systemName: "lock.fill").resizable().frame(width: 16, height: 20).foregroundColor(Color("Blue"))
                              }
                          }

                      })
                  
                }
                  
                  Section(header: Text("DATA")) {
                    NavigationLink(destination: ShowOrderHistory(orders: OrderData().previousOrderList), 
                        label: {
                            Text("> Show Orders History")
                                .foregroundColor(Color("Blue"))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        })
                    NavigationLink(destination: ShowAnalytics(),
                        label: {
                            Text("> Show My Analytics ")
                                .foregroundColor(Color("Blue"))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        })
                      
                  }
                      
                  Section(header: Text("General Settings")) {
                  Toggle(isOn: $enableNotification) {
                    Text("Enable notification")
                  }
                  
                }
                
                Section(header: Text("Application")) {
                    HStack {
                      Text("Product").foregroundColor(Color.gray)
                      Spacer()
                      Text("Buy & Run")
                    }
                
                    HStack {
                      Text("Version").foregroundColor(Color.gray)
                      Spacer()
                      Text("1.0.0")
                    }
                 
                }
                }.navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                

        //NAVIG ENDS
        }
        //
    }
  }

  struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
      SettingsView()
    }
  }
