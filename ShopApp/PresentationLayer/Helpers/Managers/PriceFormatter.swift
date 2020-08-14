//
//  PriceFormatter.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 13/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class PriceFormatter {
  
  private let numberFormatter: NumberFormatter
  
  init() {
    numberFormatter = NumberFormatter()
    numberFormatter.allowsFloats = true
    numberFormatter.groupingSize = 3
    numberFormatter.groupingSeparator = " "
    numberFormatter.maximumFractionDigits = 2
    numberFormatter.minimumFractionDigits = 2
  }
  
  func format(amount: Decimal) -> String {
    return numberFormatter.string(from: NSDecimalNumber(decimal: amount)) ?? ""
  }
  
}
