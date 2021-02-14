//
//  MakePaymentForm.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation
import Combine

class MakePaymentScreenForm: ObservableObject {
  @Published var cardNumber: String = ""
  @Published var expired: String = ""
  @Published var cvv: String = ""
  
  @Published var cardNumberError: String = ""
  @Published var expiredError: String = ""
  @Published var cvvError: String = ""
  
  private var cardNumberCancellable: AnyCancellable?
  private var expiredCancellable: AnyCancellable?
  private var cvvCancellable: AnyCancellable?
  
  init(cardNumber: String = "", expired: String = "", cvv: String = "") {
    self.cardNumber = cardNumber
    self.expired = expired
    self.cvv = cvv
    cardNumberCancellable = $cardNumber.sink(receiveValue: { [weak self] _ in
      self?.cardNumberError.removeAll()
    })
    expiredCancellable = $expired.sink(receiveValue: { [weak self] _ in
      self?.expiredError.removeAll()
    })
    cvvCancellable = $cvv.sink(receiveValue: { [weak self] _ in
      self?.cvvError.removeAll()
    })
  }
}

#if DEBUG
let mockMakePaymentScreenForm = MakePaymentScreenForm(
  cardNumber: "4111111111111111",
  expired: "10/24",
  cvv: "000"
)
#endif
