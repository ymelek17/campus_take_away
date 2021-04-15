
import SwiftUI

struct MenuEditView: View {
  
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: BuyRun.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \BuyRun.product_name, ascending: true)]) var coredata: FetchedResults<BuyRun>
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    @State private var showingAddView: Bool = false
    
    var body: some View {

    
    VStack(alignment: .center, spacing:10) {
        Text("MENU")
          .fontWeight(.bold)
          .foregroundColor(Color("Blue"))
          .modifier(TitleModifier())
        
        
        //MENU VIEW STARTS
        List {
            ForEach(self.coredata, id: \.self) { item in
                
                VStack{
                    HStack{
                        HStack{
                            Text(item.product_name ?? "Unknown")
                                .font(.title2)
                            Text("...").font(.title2)
                        }
                        .padding(.leading, 30.0)
                        Spacer()
                        HStack{
                            Text(item.price ?? "Unknown").font(.title2)
                            DeleteItemButton()
                        }.padding(.trailing, 20.0)
                    }
                    
                    Text(item.product_description ?? "Unknown") .font(.footnote)
                    
                }
                
            }.onDelete(perform: deleteProduct)
        }
        //MENU VIEW ENDS

        
        
        Spacer()
        
        VStack(alignment: .leading, spacing: 0) {
          Image(systemName: "plus.circle.fill")
            .resizable()
            .scaledToFit()
              .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 60, height: 60, alignment: .center)
        }
        .background(Color.white)
        .cornerRadius(12)
        .onTapGesture {
          self.hapticImpact.impactOccurred()
          self.showingAddView = true
        }
        .sheet(isPresented: self.$showingAddView) {
          AddItemView()
        }.padding(.bottom, 15)
        
      
  }
    
  }
    //delete function starts
    private func deleteProduct(at items: IndexSet){
        for index in items {
            let item = coredata[index]
            managedObjectContext.delete(item)
            do{
                try managedObjectContext.save()
            } catch {
                print(error)
            }
            
        }
    }
    //delete function ends
    
    
}





struct MenuEditView_Previews: PreviewProvider {
  static var previews: some View {
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
    return MenuEditView().environment(\.managedObjectContext, context)
      .previewDevice("iPhone 12 Pro")
  }
}
