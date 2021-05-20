//
//  ShowAnalytics.swift
//  ServiceProvider14Ap
//
//  Created by asli on 1.05.2021.
//

import SwiftUI

struct ShowAnalytics: View {

        @State var pickerSelection = 0
        @State var barValues : [[CGFloat]] =
            [   (0..<10).map { _ in .random(in: 20.0...300.0)},
                (0..<15).map { _ in .random(in: 10.0...100.0)}
            ]
    
        var body: some View {
            ZStack{
                Color(.white).edgesIgnoringSafeArea(.all)

                VStack(spacing: 50.0){

                    Picker(selection: $pickerSelection, label: Text("Stats"))
                        {
                        Text("Insight A").tag(0)
                        Text("Insight B").tag(1)
                        Text("Insight C").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal, 10)
                    
                    Spacer()

                    HStack(alignment: .bottom, spacing: 10)
                    {
                        if(pickerSelection==0){
                            ForEach(barValues[pickerSelection], id: \.self){
                            data in
                            BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                        }
                            
                        }
                        if(pickerSelection==1){
                            ForEach(barValues[pickerSelection], id: \.self){
                            data in
                            BarView(value: data, cornerRadius: CGFloat(integerLiteral: 10*self.pickerSelection))
                        }
                            
                        }
                        else if(pickerSelection==2){
                            VStack {
                                PieTable([
                                    (Color(red: 0.4, green: 0.6, blue: 0.6), 50),
                                    (Color(red: 0.0, green: 0.9, blue: 1.0), 50),
                                    (Color(red: 0.2, green: 0.2, blue: 0.4), 50)
                                ])
                                PieTable([
                                    (Color("grass"), 1),
                                    (Color("orangex"), 2),
                                    (Color(red: 1.0, green: 0.5, blue: 0.5), 3),
                                    (Color("fushia"), 4)
                                ])
                            }
                        }
                        
                    }.animation(.default)
                    
                    Spacer()
                    Text("")
                }
            }
        }


        init() {
            UISegmentedControl.appearance().selectedSegmentTintColor = .darkGray
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        }
    
    }


struct ShowAnalytics_Previews: PreviewProvider {
    static var previews: some View {
        ShowAnalytics()
    }
}
