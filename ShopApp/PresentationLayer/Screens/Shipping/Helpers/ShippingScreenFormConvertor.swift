//
//  ShippingScreenFormConvertor.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class ShippingScreenFormConvertor {
  
  func toShippingInfo(form: ShippingScreenForm) -> ShippingInfo {
    return ShippingInfo(
      fullName: form.fullName,
      address: form.address,
      city: form.city,
      zipCode: form.zipCode,
      country: form.country,
      shippingMethod: form.shippingMethod)
  }
}
