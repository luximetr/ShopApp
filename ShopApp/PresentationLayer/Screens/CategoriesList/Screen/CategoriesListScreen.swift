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
      Picker("Page", selection: $currentPage) {
        Text("Page1").tag(0)
        Text("Page2").tag(1)
      }
      .pickerStyle(SegmentedPickerStyle())
      .padding(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
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
