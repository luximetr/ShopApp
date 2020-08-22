//
//  CartVolumeButton.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 16/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct CartVolumeButton: View {
  
  var text: String
  var action: () -> Void
  
  var body: some View {
    Button(action: action) {
      ZStack(alignment: .topTrailing) {
        Image("supermarket")
          .resizable()
          .scaledToFit()
          .frame(width: 30, height: 30)
          .foregroundColor(appearance.action.primary.title)
          .padding(.trailing, 10)
          .padding(.top, 4)
        Text(text)
          .foregroundColor(appearance.action.primary.title)
          .font(.font(ofSize: 12))
          .frame(width: 20, height: 20)
          .background(appearance.action.primary.background)
          .cornerRadius(10)
      }
    }.buttonStyle(PlainButtonStyle())
  }
}

struct CartVolumeButton_Previews: PreviewProvider {
  static var previews: some View {
    CartVolumeButton(text: "9", action: {
      
    })
  }
}
