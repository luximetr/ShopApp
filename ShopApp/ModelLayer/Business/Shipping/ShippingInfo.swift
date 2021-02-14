//
//  ShippingInfo.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct ShippingInfo {
  let fullName: String
  let address: String
  let city: String
  let zipCode: String
  let country: String
  let shippingMethod: String
}

#if DEBUG

let mockShippingInfo = ShippingInfo(
  fullName: "John Doe",
  address: "Green str. 12",
  city: "New-York",
  zipCode: "21314",
  country: "United States",
  shippingMethod: "FedEx delivery")

#endif
