//
//  Constant.swift
//  swiftUIproject
//
//  Created by aslyy on 18.03.2021.
//

import SwiftUI

//COLOR
let colorBackground: Color = Color("ColorBackground")
let colorGray: Color = Color(UIColor.systemGray4)



let sliders: [Slider] = Bundle.main.decode("slider.json")
let categories: [Category] = Bundle.main.decode("category.json")
var brands: [Brand] = Bundle.main.decode("brand.json")
var products: [Product] = Bundle.main.decode("product.json")
var basketProducts = [Product] () 
let sampleBrand: Brand = brands[0]

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
