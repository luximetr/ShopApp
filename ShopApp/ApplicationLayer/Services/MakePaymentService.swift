//
//  MakePaymentService.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class MakePaymentService {
  
  // Dependencies
  
  private let makePaymentWebAPI: MakePaymentWebAPI
  
  // Life cycle
  init() {
    self.makePaymentWebAPI = MakePaymentWebAPI()
  }
  
  // Make payment
  
  func makePayment(
    cartItems: [CartItem],
    shippingInfo: ShippingInfo,
    paymentInfo: PaymentInfo,
    completion: @escaping Completion
  ) {
    makePaymentWebAPI.makePayment(
      cartItems: cartItems,
      shippingInfo: shippingInfo,
      paymentInfo: paymentInfo,
      completion: { webAPIResult in
        let serviceResult = ServiceResultConvertor().toServiceResult(webAPIResult)
        completion(serviceResult)
    })
  }
  
  // Typealiases
  
  typealias Completion = (ServiceResult<Any?>) -> Void
}
