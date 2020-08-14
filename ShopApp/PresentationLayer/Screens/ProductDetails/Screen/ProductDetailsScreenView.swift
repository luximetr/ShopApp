//
//  ProductDetailsScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 8/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailsScreenView: View {
  
  var product: Product
  @State private var productAmount = 1
  
  var body: some View {
    GeometryReader { geo in
      VStack(alignment: .leading, spacing: 0) {
        self.productNameView
        self.productImageView(width: geo.size.width)
        self.productDepiction
        Spacer()
        self.amountStepper
        self.addToCartButton
      }
    }
  }
  
  private var productNameView: some View {
    Text(self.product.name)
      .padding(.top, 24)
      .padding(.leading, 24)
      .font(.font(ofSize: 30, weight: .semiBold))
      .lineLimit(1)
  }
  
  private func productImageView(width: CGFloat) -> some View {
    WebImage(url: self.product.imageURL)
      .resizable()
      .scaledToFit()
      .frame(width: width, height: width / 1.5)
      .clipped()
      .padding(.top, 20)
  }
  
  private var productDepiction: some View {
    Text(self.product.depiction)
      .lineLimit(5)
      .padding(.top, 24)
      .padding([.leading, .trailing], 24)
  }
  
  private var amountStepper: some View {
    Stepper("Count: \(self.productAmount)", value: self.$productAmount, in: 1...9999)
      .padding([.leading, .trailing], 24)
      .padding(.bottom, 34)
  }
  
  private var addToCartButton: some View {
    VStack {
      Button(action: {
        print("Add to Cart")
      }, label: {
        Text("Add to Cart")
          .frame(height: 44)
          .frame(maxWidth: .infinity)
          .foregroundColor(appearance.action.primary.title)
          .background(appearance.action.primary.background)
          .cornerRadius(14)
      })
        .background(appearance.action.primary.background)
        .cornerRadius(14)
    }
    .padding([.leading, .trailing], 24)
    .padding(.bottom, 24)
  }
}

struct ProductDetailsScreenView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailsScreenView(product: mockProduct)
  }
}
