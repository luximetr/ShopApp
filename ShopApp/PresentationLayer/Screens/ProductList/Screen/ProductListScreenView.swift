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
    ProductListScreenView(products: [
      Product(imageURL: productImage, name: "Produc 1рурло рфоывр офрыолв фолырвt 1"),
      Product(imageURL: productImage, name: "Produ пафаварлофвра олфрвало рфовла ct 2"),
      Product(imageURL: productImage, name: "Produйуарй оура олйруало йуолар ойлура олct 3"),
      Product(imageURL: productImage, name: "Product 5")
    ])
  }
}

let productImage = URL(string: "https://www.gettyimages.pt/gi-resources/images/Homepage/Hero/PT/PT_hero_42_153645159.jpg")
