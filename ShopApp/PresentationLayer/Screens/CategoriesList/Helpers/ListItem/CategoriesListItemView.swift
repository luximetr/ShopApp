//
//  CategoriesListItemView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct CategoriesListItemView: View {
  
  var category: Category
  
  var body: some View {
    NavigationLink(destination: ProductListScreen(category: category)) {
      Text(category.name)
        .font(.font(ofSize: 20, weight: .semiBold))
        .foregroundColor(appearance.text.secondary)
    }
  }
}

#if DEBUG

struct CategoriesListItemView_Previews: PreviewProvider {
  static var previews: some View {
    CategoriesListItemView(category: mockCategory)
  }
}

#endif
