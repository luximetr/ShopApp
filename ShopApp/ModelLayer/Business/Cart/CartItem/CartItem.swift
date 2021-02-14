//
//  CartItem.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 13/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation
import Combine

let cartItemAmountPublisher = PassthroughSubject<Void, Never>()

class CartItem: ObservableObject {
  let id: CartItemIdType
  let product: Product
  @Published var amount: Int
  var cancellable: AnyCancellable?
  
  init(product: Product) {
    self.id = UUID().uuidString
    self.product = product
    self.amount = 1
    cancellable = self.$amount.receive(on: RunLoop.main).sink(receiveValue: { _ in
      cartItemAmountPublisher.send()
    })
  }
}

typealias CartItemIdType = String

#if DEBUG

let mockCartItems = [
  CartItem(product: mockProducts[0]),
  CartItem(product: mockProducts[1]),
  CartItem(product: mockProducts[2])
]
let mockCartItem = mockCartItems[0]

#endif
