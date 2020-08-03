//
//  ProductListScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 25/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI


struct ProductListScreenView: View {
  
  var products: [Product]
  
  var body: some View {
    productList
  }
  
  private var productList: some View {
    List {
      ForEach(products, id: \.id) { product in
        ProductListItemView(
          imageURL: product.imageURL,
          title: product.name,
          subtitle: "Subtitle",
          price: "$10.44")
            .padding([.top, .bottom], 2)
            .listRowBackground(appearance.background.secondary)
      }
    }
      .background(appearance.background.secondary)
  }
}

struct ProductListScreenView_Previews: PreviewProvider {
  static var previews: some View {
    ProductListScreenView(products: mockProducts)
  }
}
