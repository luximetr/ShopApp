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
  @Binding var isInCart: Bool
  var onAddToCart: () -> Void
  var onOpenCart: () -> Void
  
  var body: some View {
    GeometryReader { geo in
      ZStack {
        VStack(alignment: .leading, spacing: 0) {
          self.productNameView
          self.productImageView(width: geo.size.width)
          self.productDepiction
          Spacer()
        }
        self.actionButtons(width: geo.size.width)
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
  
  private func actionButtons(width: CGFloat) -> some View {
    VStack {
      Spacer()
      if self.isInCart {
        self.goToCartButton
      } else {
        self.addToCartButton
      }
    }
    .frame(width: width - 24, alignment: .trailing)
    .padding(.bottom, 24)
    .padding(.trailing, 24)
  }
  
  private var addToCartButton: some View {
    Button(action: {
      self.onAddToCart()
    }, label: {
      Image("cart_add")
        .resizable()
        .padding(.all, 12)
    })
    .frame(width: 50, height: 50)
    .foregroundColor(appearance.action.primary.title)
    .background(appearance.action.primary.background)
    .cornerRadius(25)
    .shadow(color: appearance.action.primary.shadow, radius: 10, x: 0, y: 10)
  }
  
  private var goToCartButton: some View {
    Button(action: {
      self.onOpenCart()
    }, label: {
      Image("cart_done")
        .resizable()
        .padding(.all, 12)
    })
    .frame(width: 50, height: 50)
    .foregroundColor(appearance.action.positive.title)
    .background(appearance.action.positive.background)
    .cornerRadius(25)
    .shadow(color: appearance.action.positive.shadow, radius: 10, x: 0, y: 10)
  }
}

struct ProductDetailsScreenView_Previews: PreviewProvider {
  @State static var isInCart = true
  static var previews: some View {
    ProductDetailsScreenView(
      product: mockProduct,
      isInCart: $isInCart,
      onAddToCart: {},
      onOpenCart: {}
    )
  }
}
