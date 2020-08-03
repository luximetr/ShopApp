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
  
  init(categoryId: CategoryIdType = "", imageURL: URL? = nil, name: String = "") {
    self.name = name
    self.imageURL = imageURL
    self.categoryId = categoryId
  }
}

typealias ProductIdType = String

let mockProducts = [
  Product(categoryId: "aa", imageURL: productImageURL, name: "Earphones"),
  Product(categoryId: "aa", imageURL: productImageURL, name: "Earphones"),
  Product(categoryId: "aa", imageURL: productImageURL, name: "Earphones"),
  Product(categoryId: "aa", imageURL: productImageURL, name: "Earphones"),
  Product(categoryId: "aa", imageURL: productImageURL, name: "Earphones")
]

private let productImageURL = URL(string: "https://lh3.googleusercontent.com/proxy/FJ9jk36y5usuhHqQ_L_O3iXRAX6vOUU5XxpUEVXfgCVJ2Xs_8S-m9bPVGAMyn1mATaqkPmKQnNBZKCL9JDJwL7nupJ_Qmbpn95EvZw")
