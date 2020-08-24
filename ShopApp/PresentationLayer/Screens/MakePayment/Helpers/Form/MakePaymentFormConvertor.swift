//
//  MakePaymentFormConvertor.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class MakePaymentFormConvertor {
  
  func toPaymentInfo(form: MakePaymentScreenForm) -> PaymentInfo? {
    let cardNumber = normaliseCardNumber(form.cardNumber)
    guard let (expiredMonth, expiredYear) = parseExpired(form.expired) else { return nil }
    let cvv = normaliseCVV(form.cvv)
    return PaymentInfo(
      cardNumber: cardNumber,
      expiredMonth: expiredMonth,
      expiredYear: expiredYear,
      cvv: cvv)
  }
  
  private func normaliseCardNumber(_ cardNumber: String) -> String {
    return cardNumber.filter(includedIn: .alphanumerics)
  }
  
  private func normaliseCVV(_ cvv: String) -> String {
    return cvv.filter(includedIn: .alphanumerics)
  }
  
  private func parseExpired(_ expired: String) -> (month: Int, year: Int)? {
    let divider: Character = "/"
    guard expired.contains(divider) else { return nil }
    let components = expired.split(separator: divider)
    guard components.count == 2 else { return nil }
    guard let month = Int(components[0]) else { return nil }
    guard let year = Int(components[1]) else { return nil }
    return (month, year)
  }
}
