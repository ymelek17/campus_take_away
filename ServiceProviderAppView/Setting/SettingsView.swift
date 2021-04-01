import SwiftUI

struct SettingsView: View {
    @State private var enableNotification: Bool = true

    
    var body: some View {
      VStack(alignment: .center, spacing: 0) {

        
        Form {
            Section(header: Text("Account Settings")) {
                
            Text("Company Info")
            Text("History")
            
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
