//
//  MakePaymentScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct MakePaymentScreen: View {
  
  let shippingInfo: ShippingInfo
  @ObservedObject private var form = mockMakePaymentScreenForm// MakePaymentScreenForm()
  @EnvironmentObject var cart: Cart
  @State private var needShowSuccessScreen = false
  
  private let makePaymentService = MakePaymentService()
  private let convertor = MakePaymentFormConvertor()
  private let cardNumberValidator = CardNumberValidator()
  private let expiredValidator = CardExpiredValidator()
  private let cvvValidator = CardCVVValidator()
  
  private func onContinue() {
    guard validateForm() else { return }
    guard let paymentInfo = convertor.toPaymentInfo(form: form) else { return }
    makePayment(paymentInfo)
  }
  
  private func validateForm() -> Bool {
    var isValid = true
    switch cardNumberValidator.validate(form.cardNumber) {
      case .success: break
      case .failure(let error):
        form.cardNumberError = error.message
        isValid = false
    }
    switch expiredValidator.validate(form.expired) {
      case .success: break
      case .failure(let error):
        form.expiredError = error.message
        isValid = false
    }
    switch cvvValidator.validate(form.cvv) {
      case .success: break
      case .failure(let error):
        form.cvvError = error.message
        isValid = false
    }
    return isValid
  }
  
  private func makePayment(_ paymentInfo: PaymentInfo) {
    makePaymentService.makePayment(
      cartItems: cart.items,
      shippingInfo: shippingInfo,
      paymentInfo: paymentInfo,
      completion: { result in
        switch result {
          case .success: self.needShowSuccessScreen = true
          case .failure(let error): print(error.message)
        }
    })
  }
  
  var body: some View {
    ZStack {
      MakePaymentScreenView(
        form: form,
        totalAmount: $cart.totalPrice,
        onContinue: onContinue
      )
      NavigationLink(destination: PaymentSuccessScreen(), isActive: $needShowSuccessScreen, label: { EmptyView() })
    }
  }
}

struct MakePaymentScreen_Previews: PreviewProvider {
  static var previews: some View {
    MakePaymentScreen(shippingInfo: mockShippingInfo)
  }
}
