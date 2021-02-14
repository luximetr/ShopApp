//
//  Category.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 28/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct Category {
  let id: CategoryIdType
  let name: String
}

typealias CategoryIdType = String

#if DEBUG

enum CategoryId: String {
  case earphones
  case smartphones
  case laptops
}

let mockCategory = Category(id: CategoryId.earphones.rawValue, name: "Earphones")
let mockCategories = [
  mockCategory,
  Category(id: CategoryId.smartphones.rawValue, name: "Smartphones"),
  Category(id: CategoryId.laptops.rawValue, name: "Laptops")
]

#endif
