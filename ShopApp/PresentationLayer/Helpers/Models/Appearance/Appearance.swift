//
//  Appearance.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct Appearance {
  
  // MARK: - Properties
  
  let background: Background
  let text: Text
  let statusBar: StatusBar
  let navigation: Navigation
  let tabBar: TabBar
  let action: ActionType
  let divider: DividerType
  let scrollIndicator: ScrollIndicator
  let keyboard: Keyboard

  // MARK: - Types
  
  struct Background {
    let primary: Color
    let secondary: Color
    let shadow: Color
  }
  
  struct Text {
    let primary: Color
    let secondary: Color
    let disruptive: Color
    let positive: Color
  }
  
  struct StatusBar {
    let style: StatusBarStyle
  }
  
  struct Navigation {
    let background: Color
    let tint: Color
    let shadow: Color
  }
  
  struct TabBar {
    let background: Color
    let selectedTint: Color
    let unselectedTint: Color
    let shadow: Color
  }
  
  struct ActionType {
    let primary: Action
    let secondary: Action
    let positive: Action
  }
  
  struct Action {
    let background: Color
    let title: Color
    let shadow: Color
  }
  
  struct DividerType {
    let primary: Divider
    let disruptive: Divider
  }
  
  struct Divider {
    let background: Color
  }
  
  struct ScrollIndicator {
    let style: UIScrollView.IndicatorStyle
  }
  
  struct Keyboard {
    let style: UIKeyboardAppearance
  }
}

let appearance = AppearancesFactory().createAppearance(type: .light)
