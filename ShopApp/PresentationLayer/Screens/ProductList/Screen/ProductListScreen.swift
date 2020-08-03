//
//  ProductListScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 25/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ProductListScreen: View {
  
  var category: Category
  @State var products: [Product] = []
  @State var isLoading: Bool = false
  
  private let productsService = ProductsService()
  
  var body: some View {
    ProductListScreenView(
      products: $products,
      isLoading: $isLoading
    ).onAppear {
      self.isLoading = true
      self.productsService.getProducts(
        categoryId: self.category.id,
        completion: { result in
          self.isLoading = false
          switch result {
            case .success(let products):
              self.products = products
            case .failure(let error):
              print(error)
          }
      })
    }
  }
}

struct ProductListScreen_Previews: PreviewProvider {
  static var previews: some View {
    ProductListScreen(category: mockCategory)
  }
}
