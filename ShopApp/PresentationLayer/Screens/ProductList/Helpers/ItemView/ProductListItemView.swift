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
    VStack {
      content
      dividerView
    }
  }
  
  private var content: some View {
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
      .frame(height: 110)
      .background(appearance.background.secondary)
  }
  
  private var imageView: some View {
    WebImage(url: imageURL)
      .resizable()
      .scaledToFill()
      .frame(width: 100, height: 100)
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
  
  private var dividerView: some View {
    appearance.divider.primary.background
      .frame(height: 1)
  }
}


#if DEBUG
struct ProductListItemView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ProductListItemView(
        imageURL: nil,
        title: "Product fjdskljflks jdflj slkdjflk sjdflkj sdlkfj lskdjflk sjdlfkjd asdj lkajsdk jalksjdkl ajskldj kl aljsdkl jaskld sdlkfj",
        subtitle: "Subtitle jafkdjf lkjadlkf jalkdjf klajdfkl jadklfj akldjfk ladfkj adklfj akldjf kald",
        price: "12.03 fjakld fjlkadj fkajd fkljadlkf jkaldfj  fadkfakld jfklaj dklfja kldjflk ajdfkl"
      )
        .previewLayout(.fixed(width: 360, height: 110))
      ProductListItemView(
        imageURL: nil,
        title: "Product",
        subtitle: "Subtitle",
        price: "12.03"
      )
        .previewLayout(.fixed(width: 360, height: 110))
      
      List {
        ForEach(mockProducts, id: \.id) { product in
          NavigationLink(destination: EmptyView(), label: {
            ProductListItemView(
              imageURL: product.imageURL,
              title: product.name,
              subtitle: product.depiction,
              price: "$\(product.price)"
            )
          })
            .listRowInsets(EdgeInsets(top: 15, leading: 24, bottom: 0, trailing: 24))
            .listRowBackground(appearance.background.secondary)
        }
      }
    }
    
  }
}
#endif
