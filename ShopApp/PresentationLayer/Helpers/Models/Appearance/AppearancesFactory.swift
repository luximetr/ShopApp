//
//  AppearancesFactory.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class AppearancesFactory {
  
  func createAppearance(type: AppearanceType) -> Appearance {
    switch type {
    case .light: return createLightAppearance()
    }
  }

  private func createLightAppearance() -> Appearance {
    return Appearance(
      background: .init(
        primary: .white,
        secondary: .color(red: 244, green: 244, blue: 244),
        shadow: .color(red: 200, green: 200, blue: 200)),
      text: .init(
        primary: .black,
        secondary: .gray,
        disruptive: .red,
        positive: .color(red: 113, green: 181, blue: 130)),
      statusBar: .init(
        style: .dark),
      navigation: .init(
        background: .white,
        tint: .black,
        shadow: .color(red: 170, green: 170, blue: 170)),
      tabBar: .init(
        background: .white,
        selectedTint: .blue,
        unselectedTint: .gray,
        shadow: .color(red: 170, green: 170, blue: 170)),
      action: .init(
        primary: .init(
          background: .color(red: 255, green: 204, blue: 139),
          title: .black,
          shadow: .color(red: 200, green: 200, blue: 200)),
        secondary: .init(
          background: .clear,
          title: .black,
          shadow: .clear)),
      divider: .init(
        background: .color(red: 225, green: 225, blue: 225)),
      scrollIndicator: .init(
        style: .black),
      keyboard: .init(
        style: .light)
    )
  }
}
