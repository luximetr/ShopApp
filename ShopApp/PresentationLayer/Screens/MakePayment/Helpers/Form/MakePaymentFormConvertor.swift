//
//  MakePaymentFormConvertor.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class MakePaymentFormConvertor {
  
  private let cardExpiredConvertor = CardExpiredConvertor()
  
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
    return cardNumber.filter(includedIn: .decimalDigits)
  }
  
  private func normaliseCVV(_ cvv: String) -> String {
    return cvv.filter(includedIn: .decimalDigits)
  }
  
  private func parseExpired(_ expired: String) -> (month: Int, year: Int)? {
    return cardExpiredConvertor.toExpired(expired)
  }
}
