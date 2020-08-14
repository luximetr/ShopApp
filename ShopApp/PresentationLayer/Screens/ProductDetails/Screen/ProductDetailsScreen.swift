//
//  ProductDetailsScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ProductDetailsScreen: View {
  
  var product: Product
  
  var body: some View {
    ProductDetailsScreenView(product: product)
  }
}
