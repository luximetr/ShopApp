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
  
  init() {
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
