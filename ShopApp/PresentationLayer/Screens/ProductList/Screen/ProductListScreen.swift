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
  
  var body: some View {
    ProductListScreenView(products: mockProducts)
  }
}

struct ProductListScreen_Previews: PreviewProvider {
  static var previews: some View {
    ProductListScreen(category: mockCategory)
  }
}
