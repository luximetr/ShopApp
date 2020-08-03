//
//  CategoriesListScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct CategoriesListScreen: View {
  
  @State var currentPage: Int = 0
  @State var categories: [Category] = mockCategories
  @State var isLoading: Bool = false
  
  private let categoriesService = CategoriesService()
  
  var body: some View {
    CategoriesListScreenView(
      categories: $categories,
      isLoading: $isLoading
    ).onAppear(perform: {
      self.isLoading = true
      self.categoriesService.getCategories(completion: { result in
        self.isLoading = false
        switch result {
          case .success(let categories):
            self.categories = categories
          case .failure(let error):
            print(error)
        }
      })
    })
  }
}

struct CategoriesListScreen_Previews: PreviewProvider {
  static var previews: some View {
    CategoriesListScreen()
  }
}
