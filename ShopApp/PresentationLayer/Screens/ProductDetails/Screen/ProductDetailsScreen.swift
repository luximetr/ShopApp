//
//  ProductDetailsScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ProductDetailsScreen: View {
  
  @EnvironmentObject private var cart: Cart
  @State private var isInCart: Bool
  private let product: Product
  
  init(product: Product, isInCart: Bool) {
    self.product = product
    _isInCart = State(initialValue: isInCart)
  }
  
  private func onAddToCart() {
    cart.addProduct(product)
    isInCart = true
  }
  
  private func onOpenCart() {
    updateIsCartPresentedPublisher.send(true)
  }
  
  private func onCartRemovedProduct(_ productId: ProductIdType) {
    guard productId == self.product.id else { return }
    self.isInCart = false
  }
  
  var body: some View {
    ProductDetailsScreenView(
      product: product,
      isInCart: $isInCart,
      onAddToCart: self.onAddToCart,
      onOpenCart: self.onOpenCart
    )
      .navigationBarTitle("\(product.name)", displayMode: .inline)
      .navigationBarItems(trailing: cartButton)
      .onReceive(removedProductFromCartPublisher.receive(on: DispatchQueue.main), perform: onCartRemovedProduct(_:))
  }
  
  private var cartButton: some View {
    CartVolumeButton(
      text: "\(cart.items.count)",
      action: {
        updateIsCartPresentedPublisher.send(true)
    })
  }
}
