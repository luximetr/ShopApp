//
//  CardCVVValidator.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class CardCVVValidator {
  
  func validate(_ cvv: String) -> ValidatorResult {
    guard cvv.count == 3 else {
      return .failure(.init(message: "Required 3 numbers"))
    }
    let numbersOnly = cvv.filter(includedIn: .decimalDigits)
    guard numbersOnly.count == 3 else {
      return .failure(.init(message: "Required 3 numbers"))
    }
    return .success(true)
  }
}
