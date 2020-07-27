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
  
  var body: some View {
    VStack {
      Text("\(currentPage)")
      PageView([
        ProductListScreen(),
        ProductListScreen()
      ], currentPage: $currentPage)
    }
  }
}

struct CategoriesListScreen_Previews: PreviewProvider {
  static var previews: some View {
    CategoriesListScreen()
  }
}
