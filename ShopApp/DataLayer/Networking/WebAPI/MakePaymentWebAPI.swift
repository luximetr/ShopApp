//
//  MakePaymentWebAPI.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class MakePaymentWebAPI {
  
  func makePayment(
    cartItems: [CartItem],
    shippingInfo: ShippingInfo,
    paymentInfo: PaymentInfo,
    completion: @escaping Completion
  ) {
    DispatchQueue.main.asyncAfter(deadline: .now() + webAPIDelay) {
      completion(.success(nil))
    }
  }
  
  typealias Completion = (WebAPIResult<Any?>) -> Void
}
