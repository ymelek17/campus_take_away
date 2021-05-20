//
//  CampaignView.swift
//  swiftUIproject
//
//  Created by aslyy on 31.03.2021.
//

import SwiftUI

struct CampaignView: View {
    var body: some View {
        TabView {
          ForEach(coupons) { coupon in 
            CouponView(coupon: coupon)
          }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
      }
    }

struct CampaignView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignView()
    }
}
