//
//  CardExpiredValidator.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class CardExpiredValidator {
  
  private let convertor = CardExpiredConvertor()
  
  func validate(_ expired: String) -> ValidatorResult {
    let divider = "/"
    guard !expired.isEmpty else {
      return .failure(.init(message: "Required field"))
    }
    guard expired.contains(divider) else {
      return .failure(.init(message: "Required \(divider) divider"))
    }
    guard let (month, year) = convertor.toExpired(expired) else {
      return .failure(.init(message: "Required MM/YY format"))
    }
    guard month > 0 && month <= 12 else {
      return .failure(.init(message: "Month should be in range between 1 and 12"))
    }
    guard year >= 20 else {
      return .failure(.init(message: "Year should be bigger than 20"))
    }
    return .success(true)
  }
}
