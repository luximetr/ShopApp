//
//  CartItemsListScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 13/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct CartItemsListScreenView: View {
  
  @State var items: [CartItem] = []
  
  var body: some View {
    List {
      ForEach(items, id: \.id) { item in
        CartItemsListItemView(
          item: item,
          onRemove: {
            print("remove " + item.product.name)
        })
          .listRowInsets(.some(EdgeInsets()))
          .listRowBackground(appearance.background.secondary)
      }
    }
    .background(appearance.background.secondary)
  }
  
}

struct CartItemsListScreenView_Previews: PreviewProvider {
  static var previews: some View {
    CartItemsListScreenView(items: mockCartItems)
  }
}
