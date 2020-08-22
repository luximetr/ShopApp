//
//  CartItemsListScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 13/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI
import Combine

struct CartItemsListScreenView: View {
  
  @ObservedObject var cart: Cart
  var onRemoveItem: (CartItem) -> Void
  var onCheckOut: () -> Void
  var onContinueShopping: () -> Void
  private let priceFormatter = PriceFormatter()
  
  var body: some View {
    VStack {
      list
      totalAmountView
      checkOutButton
      continueButton
    }
    .background(appearance.background.secondary)
  }
  
  var list: some View {
    List {
      ForEach(cart.items, id: \.id) { item in
        CartItemsListItemView(
          item: item,
          onRemove: { self.onRemoveItem(item)}
        )
        .environmentObject(item)
          .listRowInsets(.some(EdgeInsets()))
          .listRowBackground(appearance.background.secondary)
      }
    }
  }
  
  var totalAmountView: some View {
    HStack {
      Text("Total amount")
      Spacer()
      Text("$\(priceFormatter.format(amount: cart.totalPrice))")
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 16)
  }
  
  var checkOutButton: some View {
    Button(action: {
      self.onCheckOut()
    }) {
      Text("Check out")
    }
    .buttonStyle(PrimaryButtonStyle())
    .padding(.horizontal, 24)
  }
  
  var continueButton: some View {
    Button(action: {
      self.onContinueShopping()
    }) {
      Text("Continue shopping")
    }
    .buttonStyle(SecondaryButtonStyle())
    .padding(.bottom, 8)
    .padding(.top, 8)
  }
  
}

//struct CartItemsListScreenView_Previews: PreviewProvider {
//  @State static var items = mockCartItems
//  static var previews: some View {
//    CartItemsListScreenView(
//      items: $items,
//      onRemoveItem: { item in print(item) }
//    )
//  }
//}
