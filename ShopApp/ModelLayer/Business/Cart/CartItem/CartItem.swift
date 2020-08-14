//
//  CartItem.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 13/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct CartItem {
  let id: CartItemIdType
  let product: Product
  let amount: Int
}

typealias CartItemIdType = String

let mockCartItems = [
  CartItem(id: UUID().uuidString, product: mockProducts[0], amount: 1),
  CartItem(id: UUID().uuidString, product: mockProducts[1], amount: 2),
  CartItem(id: UUID().uuidString, product: mockProducts[2], amount: 1)
]
let mockCartItem = mockCartItems[0]
