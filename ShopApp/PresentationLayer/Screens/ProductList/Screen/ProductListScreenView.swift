//
//  ProductListScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 25/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI


struct ProductListScreenView: View {
  
  @Binding var products: [Product]
  @Binding var isLoading: Bool
  
  var body: some View {
    Group {
      if isLoading {
        ActivityIndicator(style: .medium)
      } else {
        productList
      }
    }
  }
  
  private var productList: some View {
    List {
      ForEach(products, id: \.id) { product in
        ProductListItemView(
          imageURL: product.imageURL,
          title: product.name,
          subtitle: product.depiction,
          price: "$\(product.price)")
            .padding([.top, .bottom], 2)
            .listRowBackground(appearance.background.secondary)
      }
    }
      .background(appearance.background.secondary)
  }
}

struct ProductListScreenView_Previews: PreviewProvider {
  @State static var isLoading = false
  @State static var products = mockProducts
  static var previews: some View {
    ProductListScreenView(products: $products, isLoading: $isLoading)
  }
}
