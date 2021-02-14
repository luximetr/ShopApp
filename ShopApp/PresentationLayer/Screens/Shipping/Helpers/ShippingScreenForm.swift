//
//  ShippingScreenForm.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 20/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct ShippingScreenForm {
  var fullName: String = ""
  var fullNameError: String = ""
  var address: String = ""
  var addressError: String = ""
  var city: String = ""
  var cityError: String = ""
  var zipCode: String = ""
  var zipCodeError: String = ""
  var country: String = ""
  var countryError: String = ""
  var shippingMethod = ""
  var shippingMethodError: String = ""
}

#if DEBUG
let mockShippingScreenForm = ShippingScreenForm(
  fullName: "John Doe",
  fullNameError: "",
  address: "Wall str",
  addressError: "",
  city: "New-York",
  cityError: "",
  zipCode: "20131",
  zipCodeError: "",
  country: "United States",
  countryError: "",
  shippingMethod: "FedEx delivery",
  shippingMethodError: "")
#endif
