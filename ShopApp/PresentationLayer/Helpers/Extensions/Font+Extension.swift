//
//  Font+Extension.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

extension Font {
  
  static func font(ofSize size: CGFloat,
       weight: FontWeight = .regular,
       family: FontFamily = .system) -> Font {
    Font.system(size: size, weight: convertToFontWeight(weight))
  }
  
  private static func convertToFontWeight(_ weight: FontWeight) -> Font.Weight {
    switch weight {
    case .regular: return .regular
    case .medium: return .medium
    case .semiBold: return .semibold
    case .bold: return .bold
    }
  }
  
}
