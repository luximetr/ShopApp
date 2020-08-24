//
//  PrimaryButtonStyle.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 16/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.all, 14)
      .foregroundColor(appearance.action.primary.title)
      .font(.font(ofSize: 15, weight: .medium))
      .background(appearance.action.primary.background)
      .cornerRadius(40)
      .shadow(color: appearance.action.primary.shadow, radius: 10, x: 0, y: 10)
  }
}

struct PrimaryButtonStyle_Previews: PreviewProvider {
  
  static var previews: some View {
    Button("Button") {
      
    }
    .buttonStyle(PrimaryButtonStyle())
  }
}
