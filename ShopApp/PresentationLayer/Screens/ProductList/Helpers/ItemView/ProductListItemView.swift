//
//  ProductListItemView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 25/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductListItemView: View {
  
  let imageURL: URL?
  let title: String
  let subtitle: String
  let price: String
  
  var body: some View {
    HStack {
      imageView
      VStack(alignment: .leading) {
        titleView
        subtitleView
        Spacer()
        priceView
      }
      .padding([.leading, .trailing], 4)
      Spacer()
    }
    .background(appearance.background.primary)
    .cornerRadius(10)
    .shadow(color: appearance.background.shadow, radius: 5, y: 5)
    .frame(height: 110)
  }
  
  private var imageView: some View {
    WebImage(url: imageURL)
      .resizable()
      .scaledToFill()
      .frame(width: 110, height: 110)
      .clipped()
  }
  
  private var titleView: some View {
    Text(title)
      .lineLimit(1)
      .font(.font(ofSize: 20, weight: .semiBold))
      .foregroundColor(appearance.text.primary)
      .padding(.top, 8)
  }
  
  private var subtitleView: some View {
    Text(subtitle)
      .lineLimit(2)
      .font(.font(ofSize: 12))
      .foregroundColor(appearance.text.secondary)
      .padding(.top, 2)
  }
  
  private var priceView: some View {
    Text(price)
      .lineLimit(1)
      .font(.font(ofSize: 18))
      .foregroundColor(appearance.text.primary)
      .padding(.bottom, 8)
  }
}

struct ProductListItemView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ProductListItemView(
        imageURL: nil,
        title: "Product fjdskljflks jdflj slkdjflk sjdflkj sdlkfj lskdjflk sjdlfkjd asdj lkajsdk jalksjdkl ajskldj kl aljsdkl jaskld sdlkfj",
        subtitle: "Subtitle jafkdjf lkjadlkf jalkdjf klajdfkl jadklfj akldjfk ladfkj adklfj akldjf kald",
        price: "12.03 fjakld fjlkadj fkajd fkljadlkf jkaldfj  fadkfakld jfklaj dklfja kldjflk ajdfkl"
      )
        .previewLayout(.fixed(width: 360, height: 140))
      ProductListItemView(
        imageURL: nil,
        title: "Product",
        subtitle: "Subtitle",
        price: "12.03"
      )
        .previewLayout(.fixed(width: 360, height: 140))
    }
    
  }
}
