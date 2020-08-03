//
//  Product.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct Product {
  let id: ProductIdType = UUID().uuidString
  let categoryId: CategoryIdType
  let imageURL: URL?
  let name: String
  let depiction: String
  let price: Decimal
  
  init(categoryId: CategoryIdType, imageURL: URL?, name: String, depiction: String, price: Decimal) {
    self.name = name
    self.imageURL = imageURL
    self.categoryId = categoryId
    self.depiction = depiction
    self.price = price
  }
}

typealias ProductIdType = String

// Mocks

let mockSmartphoneProducts = [
  Product(
    categoryId: CategoryId.smartphones.rawValue,
    imageURL: URL(string: "https://static.digit.in/default/b4e18cd02ebe74dfd5fbf178853c08e9e1118cfb.jpeg?tr=w-1200"),
    name: "IPhone X",
    depiction: "2018 Apple powerful product",
    price: Decimal(999)),
  Product(
    categoryId: CategoryId.smartphones.rawValue,
    imageURL: URL(string: "https://www.notebookcheck.net/fileadmin/_processed_/b/a/csm_4_zu_3_Teaser_Huawei_P40_Pro_7507_0546c7bf80.jpg"),
    name: "Huawei",
    depiction: "Powerful device with one of the best cameras",
    price: Decimal(849)),
  Product(
    categoryId: CategoryId.smartphones.rawValue,
    imageURL: URL(string: "https://cdn.arstechnica.net/wp-content/uploads/2019/08/Note10-7-800x600.jpg"),
    name: "Samsung Galaxy Note 10",
    depiction: "Big phone with stilus",
    price: Decimal(1099))
]
let mockEarphoneProducts = [
  Product(
    categoryId: CategoryId.earphones.rawValue,
    imageURL: URL(string: "https://images-na.ssl-images-amazon.com/images/I/61CkEyP9n3L._SL1500_.jpg"),
    name: "OPPO",
    depiction: "Good earphones with microphone",
    price: Decimal(49)),
  Product(
    categoryId: CategoryId.earphones.rawValue,
    imageURL: URL(string: "https://ae01.alicdn.com/kf/HTB1DaPyX_jxK1Rjy0Fnq6yBaFXaN/Langsdom-L33-Bluetooth-Earphone-Wireless-Earphones-audifonos-Magnetic-Switch-Bluetooth-In-ear-Headset-With-Mic-Stereo.jpg"),
    name: "Magnetic",
    depiction: "Well quality earphones",
    price: Decimal(29)),
  Product(
    categoryId: CategoryId.earphones.rawValue,
    imageURL: URL(string: "https://cf.shopee.sg/file/31f31524e73a77aaddf2b63c5b21a9e1"),
    name: "AKG",
    depiction: "Well known company's product",
    price: Decimal(99))
]
let mockLaptopProducts = [
  Product(
    categoryId: CategoryId.laptops.rawValue,
    imageURL: URL(string: "https://zdnet1.cbsistatic.com/hub/i/r/2020/03/19/4d0e4e03-c980-43db-aa0f-2572aefcf89f/resize/1200x900/4a4509da96fc6d87280dc73238588f3e/surface-laptop-3-13-5-header.jpg"),
    name: "Microsoft Surface",
    depiction: "Flexible laptop for office workers",
    price: Decimal(1399)),
  Product(
    categoryId: CategoryId.laptops.rawValue,
    imageURL: URL(string: "https://cdn.mos.cms.futurecdn.net/ahevYTh9pWRzkNPF85MQhb-1200-80.jpg"),
    name: "HP",
    depiction: "Fast and light laptop for travelers",
    price: Decimal(1499)),
  Product(
    categoryId: CategoryId.laptops.rawValue,
    imageURL: URL(string: "https://i.dell.com/sites/csimages/Video_Imagery/all/xps_7590_touch.png"),
    name: "DELL",
    depiction: "Good for gamers",
    price: Decimal(1999))
]

let mockProducts = mockSmartphoneProducts

private let productImageURL = URL(string: "https://lh3.googleusercontent.com/proxy/FJ9jk36y5usuhHqQ_L_O3iXRAX6vOUU5XxpUEVXfgCVJ2Xs_8S-m9bPVGAMyn1mATaqkPmKQnNBZKCL9JDJwL7nupJ_Qmbpn95EvZw")
