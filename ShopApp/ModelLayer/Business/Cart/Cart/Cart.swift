//
//  Cart.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 16/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation
import Combine

class Cart: ObservableObject {
  @Published var items: [CartItem]
  @Published var totalPrice: Decimal
  
  private var cancellable: AnyCancellable?
  
  init(items: [CartItem] = []) {
    self.items = items
    self.totalPrice = 0
    cancellable = cartItemAmountPublisher.sink(receiveValue: { [weak self] in
      guard let self = self else { return }
      self.totalPrice = self.items.reduce(0) { (result, item) -> Decimal in
        return result + item.product.price * Decimal(item.amount)
      }
    })
  }
  
  func addProduct(_ product: Product) {
    guard !getIsProductInCart(product.id) else { return }
    items.append(CartItem(product: product))
  }
  
  func removeProduct(_ productId: ProductIdType) {
    guard let index = items.firstIndex(where: { $0.product.id == productId }) else { return }
    items.remove(at: index)
  }
  
  func removeItem(_ item: CartItem) {
    removeProduct(item.product.id)
  }
  
  private func getIsProductInCart(_ productId: ProductIdType) -> Bool {
    return items.contains(where: { $0.product.id == productId })
  }
}

let mockCart = Cart(items: mockCartItems)
