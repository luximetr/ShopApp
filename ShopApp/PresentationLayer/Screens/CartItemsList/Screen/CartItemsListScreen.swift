//
//  CartItemsListScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 13/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI
import Combine

struct CartItemsListScreen: View {
  
  @EnvironmentObject var cart: Cart
  @State private var needShowShippingScreen = false
  
  private var cancellable: AnyCancellable?
  
  private func onRemoveItem(item: CartItem) {
    cart.removeItem(item)
  }
  
  private func onCheckOut() {
    needShowShippingScreen = true
  }
  
  private func onContinueShopping() {
    updateIsCartPresentedPublisher.send(false)
//    NotificationCenter.default.post(name: .updateIsCartPresented, object: false)
  }
  
  var body: some View {
    NavigationView {
      ZStack {
        CartItemsListScreenView(
          cart: cart,
          onRemoveItem: onRemoveItem(item:),
          onCheckOut: onCheckOut,
          onContinueShopping: onContinueShopping
        )
        NavigationLink(
          destination: ShippingScreen(),
          isActive: $needShowShippingScreen) {
            EmptyView()
        }
      }
        .navigationBarTitle("Cart", displayMode: .inline)
    }
  }
}

struct CartItemsListScreen_Previews: PreviewProvider {
  static var previews: some View {
    CartItemsListScreen()
      .environmentObject(Cart())
  }
}
