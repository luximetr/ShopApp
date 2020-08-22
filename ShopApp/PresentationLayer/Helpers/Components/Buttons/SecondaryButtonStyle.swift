//
//  SecondaryButtonStyle.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 16/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .frame(minWidth: 0, maxWidth: .infinity)
      .padding(.all, 16)
      .foregroundColor(appearance.action.secondary.title)
      .font(.font(ofSize: 13, weight: .medium))
      .background(appearance.action.secondary.background)
  }
}

struct SecondaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
      Button("Button") {
        
      }
      .buttonStyle(SecondaryButtonStyle())
    }
}
