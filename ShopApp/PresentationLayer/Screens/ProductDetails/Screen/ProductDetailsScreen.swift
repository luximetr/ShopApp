//
//  ProductDetailsScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ProductDetailsScreen: View {
  
  @EnvironmentObject var cart: Cart
  @State private var isCartPresented = false
  var product: Product
  
  private func onAddToCart() {
    cart.addProduct(product)
  }
  
  var body: some View {
    ProductDetailsScreenView(
      product: product,
      onAddToCart: self.onAddToCart
    )
      .sheet(isPresented: self.$isCartPresented) {
        CartItemsListScreen()
          .environmentObject(self.cart)
      }
      .navigationBarTitle("\(product.name)", displayMode: .inline)
      .navigationBarItems(trailing: cartButton)
  }
  
  private var cartButton: some View {
    CartVolumeButton(
      text: "\(cart.items.count)",
      action: {
        self.isCartPresented = true
    })
  }
}
