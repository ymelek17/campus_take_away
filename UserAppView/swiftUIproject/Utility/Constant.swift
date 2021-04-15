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
let brands: [Brand] = Bundle.main.decode("brand.json")
let products: [Product] = Bundle.main.decode("product.json")
let sampleBrand: Brand = brands[0]

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
