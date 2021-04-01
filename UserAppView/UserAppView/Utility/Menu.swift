//
//  Menu.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import Foundation

class Menu: ObservableObject{
    @Published var showingBrand: Bool = false
    @Published var selectedBrand: Brand? = nil
}
