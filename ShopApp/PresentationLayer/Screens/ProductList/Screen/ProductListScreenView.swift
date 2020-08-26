//
//  ProductListScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 25/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI


struct ProductListScreenView: View {
  
  @EnvironmentObject private var cart: Cart
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
    .background(appearance.background.secondary)
    .navigationBarTitle("Products")
  }
  
  private var productList: some View {
    List {
      ForEach(products, id: \.id) { product in
        NavigationLink(
          destination:
            ProductDetailsScreen(
              product: product,
              isInCart: self.cart.getIsProductInCart(product.id))) {
          ProductListItemView(
            imageURL: product.imageURL,
            title: product.name,
            subtitle: product.depiction,
            price: "$\(product.price)"
          )
        }
        .listRowInsets(EdgeInsets(top: 15, leading: 24, bottom: 0, trailing: 24))
        .listRowBackground(appearance.background.secondary)
      }
    }
  }
  
  private func productDetailsNavigationLink(product: Product) -> some View {
    NavigationLink(
      destination:
        ProductDetailsScreen(
          product: product,
          isInCart: self.cart.getIsProductInCart(product.id))) {
      EmptyView()
    }
  }
}

struct ProductListScreenView_Previews: PreviewProvider {
  @State static var isLoading = false
  @State static var products = mockProducts
  static var previews: some View {
    ProductListScreenView(
      products: $products,
      isLoading: $isLoading
    )
  }
}
