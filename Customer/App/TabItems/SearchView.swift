//
//  SearchView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                SearchBar(searchText: $searchText, isSearching: $isSearching) 
                //SAYILAR GERÇEK PRODUCTLA DEĞİŞİCEK
                ForEach((products).filter({ "\($0)".contains(searchText) || searchText.isEmpty }))
                { product in
                    
                    HStack {
                        Text(product.product_name)
                        Spacer()
                        Button(action: {},
                           label: {
                            Image(systemName: "plus.circle")})
                            }.padding(.horizontal, 40.0)
                            .padding(.vertical, 15.0)
                    
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.leading)
                }
            }
            .navigationTitle("Food")
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            SearchView()
        }.previewLayout(.fixed(width: 600, height: 600))
        
    }
}
