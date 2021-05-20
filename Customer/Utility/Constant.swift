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
let coupons: [Coupon] = Bundle.main.decode("coupon.json")
var brands: [Brand] = Bundle.main.decode("brand.json")
var products = [Product] ()
var basketList = [Product] ()
var cafeList = [String : CafeModel]()
var basketTotal = 0.0
var current_brand = ""
let sampleBrand: Brand = brands[0]
var timeslotMap: [Int: String] = [1: "8.00-8.30", 2: "8.30-9.00", 3: "9.00-9.30", 4: "9.30-10.00", 5: "10.00-10.30", 6: "10.30-11.00", 7: "11.00-11.30", 8: "11.30-12.00", 9: "12.00-12.30", 10: "12.30-13.00", 11: "13.00-13.30",12: "13.30-14.00", 13: "14.00-14.30", 14: "14.30-15.00",15: "15.00-15.30", 16: "15.30-16.00", 17: "16.00-16.30", 18: "16.30-17.00",19: "17.00-17.30", 20: "17.30-18.00"]
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
  return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}
