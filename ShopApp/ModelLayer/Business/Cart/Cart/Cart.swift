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
  
  private var itemAcountCancellable: AnyCancellable?
  private var itemsCancellable: AnyCancellable?
  
  init(items: [CartItem] = []) {
    self.items = items
    self.totalPrice = 0
    setupListeners()
  }
  
  private func setupListeners() {
    itemAcountCancellable = cartItemAmountPublisher.sink(receiveValue: { [weak self] in
      self?.updateTotalPrice(items: self?.items ?? [])
    })
    itemsCancellable = $items.sink(receiveValue: { [weak self] receivedItems in
      self?.updateTotalPrice(items: receivedItems)
    })
  }
  
  private func updateTotalPrice(items: [CartItem]) {
    self.totalPrice = items.reduce(0) { (result, item) -> Decimal in
      return result + item.product.price * Decimal(item.amount)
    }
  }
  
  func addProduct(_ product: Product) {
    guard !getIsProductInCart(product.id) else { return }
    items.append(CartItem(product: product))
  }
  
  func removeProduct(_ productId: ProductIdType) {
    guard let index = items.firstIndex(where: { $0.product.id == productId }) else { return }
    items.remove(at: index)
    removedProductFromCartPublisher.send(productId)
  }
  
  func removeItem(_ item: CartItem) {
    removeProduct(item.product.id)
  }
  
  func clear() {
    items.removeAll()
  }
  
  func getIsProductInCart(_ productId: ProductIdType) -> Bool {
    return items.contains(where: { $0.product.id == productId })
  }
}

let removedProductFromCartPublisher = PassthroughSubject<ProductIdType, Never>()

let mockCart = Cart(items: mockCartItems)
