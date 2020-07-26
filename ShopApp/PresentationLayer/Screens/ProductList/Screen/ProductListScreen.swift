//
//  ProductListScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 25/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ProductListScreen: View {
    var body: some View {
        ProductListScreenView(products: [
          Product(imageURL: productImage, name: "Produc 1рурло рфоывр офрыолв фолырвt 1"),
          Product(imageURL: productImage, name: "Produ пафаварлофвра олфрвало рфовла ct 2"),
          Product(imageURL: productImage, name: "Produйуарй оура олйруало йуолар ойлура олct 3"),
          Product(imageURL: productImage, name: "Productf qe quefhk jzjk qjkehd jkqehdfjk hqedjkh  4"),
          Product(imageURL: productImage, name: "Product 5")
        ])
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductListScreen()
    }
}
