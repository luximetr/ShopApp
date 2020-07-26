//
//  Product.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct Product {
  let id: String = UUID().uuidString
  let imageURL: URL?
  let name: String
}
