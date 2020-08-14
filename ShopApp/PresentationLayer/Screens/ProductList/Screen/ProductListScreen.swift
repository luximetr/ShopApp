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
  @State var needLoadOnAppear = true
  
  private let productsService = ProductsService()
  
  private func viewOnAppear() {
    guard self.needLoadOnAppear else { return }
    self.isLoading = true
    self.productsService.getProducts(
      categoryId: self.category.id,
      completion: { result in
        self.isLoading = false
        self.needLoadOnAppear = false
        switch result {
          case .success(let products):
            self.products = products
          case .failure(let error):
            print(error)
        }
    })
  }
  
  var body: some View {
    ProductListScreenView(
      products: $products,
      isLoading: $isLoading
    ).onAppear {
      self.viewOnAppear()
    }
  }
}

struct ProductListScreen_Previews: PreviewProvider {
  static var previews: some View {
    ProductListScreen(
      category: mockCategory
    )
  }
}
