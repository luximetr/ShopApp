//
//  CardNumberValidator.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class CardNumberValidator {
  
  func validate(_ cardNumber: String) -> ValidatorResult {
    guard cardNumber.count == 16 else {
      return .failure(.init(message: "Required 16 numbers"))
    }
    let numbersOnly = cardNumber.filter(includedIn: .decimalDigits)
    guard numbersOnly.count == 16 else {
      return .failure(.init(message: "Required 16 numbers"))
    }
    return .success(true)
  }
}
