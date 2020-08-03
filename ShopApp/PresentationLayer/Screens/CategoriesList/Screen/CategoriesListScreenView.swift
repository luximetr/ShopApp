//
//  CategoriesListScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct CategoriesListScreenView: View {
  
  @State var currentPage: Int = 0
  @Binding var categories: [Category]
  @Binding var isLoading: Bool
  
  var body: some View {
    Group {
      if isLoading {
        ActivityIndicator(style: .medium)
      } else {
        dataContent
      }
    }
  }
  
  private var dataContent: some View {
    VStack {
      ScrollTextSegmentedView(
        selectedIndex: $currentPage,
        data: self.categories.map { $0.name })
        .padding(.top, 12).padding(.bottom, 4)
      PageView(
        self.categories.map { ProductListScreen(category: $0) },
        currentPage: $currentPage)
    }
    .background(appearance.background.secondary)
  }
}


struct CategoriesListScreenView_Previews: PreviewProvider {
  @State static var categories = mockCategories
  @State static var isLoading = false
  static var previews: some View {
    CategoriesListScreenView(
      categories: $categories,
      isLoading: $isLoading)
  }
}
