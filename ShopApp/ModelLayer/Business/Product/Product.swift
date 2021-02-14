//
//  Product.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct Product {
  let id: ProductIdType
  let imageURL: URL?
  let name: String
  let depiction: String
  let price: Decimal
  
    init(id: ProductIdType = UUID().uuidString, imageURL: URL?, name: String, depiction: String, price: Decimal) {
    self.id = id
    self.name = name
    self.imageURL = imageURL
    self.depiction = depiction
    self.price = price
  }
}

typealias ProductIdType = String

#if DEBUG

let mockEarphoneProducts = [
  Product(
    imageURL: URL(string: "https://images-na.ssl-images-amazon.com/images/I/61CkEyP9n3L._SL1500_.jpg"),
    name: "OPPO",
    depiction: "Good earphones with microphone",
    price: Decimal(49)),
  Product(
    imageURL: URL(string: "https://ae01.alicdn.com/kf/HTB1DaPyX_jxK1Rjy0Fnq6yBaFXaN/Langsdom-L33-Bluetooth-Earphone-Wireless-Earphones-audifonos-Magnetic-Switch-Bluetooth-In-ear-Headset-With-Mic-Stereo.jpg"),
    name: "Magnetic",
    depiction: "Well quality earphones",
    price: Decimal(29)),
  Product(
    imageURL: URL(string: "https://cf.shopee.sg/file/31f31524e73a77aaddf2b63c5b21a9e1"),
    name: "AKG",
    depiction: "Well known company's product",
    price: Decimal(99))
]

let mockProducts = mockEarphoneProducts
let mockProduct = mockProducts[0]

private let productImageURL = URL(string: "https://lh3.googleusercontent.com/proxy/FJ9jk36y5usuhHqQ_L_O3iXRAX6vOUU5XxpUEVXfgCVJ2Xs_8S-m9bPVGAMyn1mATaqkPmKQnNBZKCL9JDJwL7nupJ_Qmbpn95EvZw")

#endif
