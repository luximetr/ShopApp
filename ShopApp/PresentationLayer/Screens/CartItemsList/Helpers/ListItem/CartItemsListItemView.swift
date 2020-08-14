//
//  CartItemsListItemView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 13/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartItemsListItemView: View {
  
  @State var item: CartItem
  @State var amount: Int = 1
  private let priceFormatter = PriceFormatter()
  var onRemove: () -> Void
  
  var body: some View {
    VStack(spacing: 0) {
      content
      dividerView
    }
  }
  
  private var content: some View {
    HStack {
      imageView
      VStack(alignment: .leading) {
        HStack(alignment: .top) {
          productInfoView
          Spacer()
          removeButton
        }
        Spacer()
        HStack {
          Spacer()
          amountStepperView
        }
      }
    }
    .padding([.leading, .trailing], 16)
    .padding([.top, .bottom], 24)
    .frame(height: 150)
  }
  
  private var imageView: some View {
    WebImage(url: item.product.imageURL)
      .resizable()
      .scaledToFill()
      .frame(width: 100, height: 100)
      .clipped()
  }
  
  private var productInfoView: some View {
    VStack(alignment: .leading) {
      productNameView
      productPriceView
    }
    .padding(.leading, 10)
  }
  
  private var productNameView: some View {
    Text(item.product.name)
      .font(.font(ofSize: 16, weight: .semiBold))
  }
  
  private var productPriceView: some View {
    Text("$" + priceFormatter.format(amount: item.product.price))
      .font(.font(ofSize: 14))
  }
  
  private var removeButton: some View {
    Button("Remove") {
      self.onRemove()
    }
    .accentColor(appearance.text.secondary)
    .buttonStyle(BorderlessButtonStyle())
  }
  
  private var amountStepperView: some View {
    StepperView(count: self.$amount)
  }
  
  private var dividerView: some View {
    appearance.divider.background
      .frame(height: 1)
      .padding([.leading, .trailing], 16)
  }
  
}

struct CartItemsListItemView_Previews: PreviewProvider {
  static var previews: some View {
    CartItemsListItemView(
      item: mockCartItem,
      onRemove: {
        print("Remove item")
    })
//      .border(Color.blue)
  }
}
