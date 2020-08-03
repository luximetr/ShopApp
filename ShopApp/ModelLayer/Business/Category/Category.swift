//
//  Category.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 28/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct Category {
  let id: CategoryIdType = UUID().uuidString
  let name: String
}

typealias CategoryIdType = String

let mockCategory = Category(name: "Earphones")
let mockCategories = [
  mockCategory,
  Category(name: "Smartphones"),
  Category(name: "Laptops")
]
