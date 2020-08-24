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
  @State private var form = MakePaymentScreenForm()
  @EnvironmentObject var cart: Cart
  @State private var needShowSuccessScreen = false
  
  private let makePaymentService = MakePaymentService()
  private let convertor = MakePaymentFormConvertor()
  
  private func onContinue() {
    guard validateForm() else { return }
    guard let paymentInfo = convertor.toPaymentInfo(form: form) else { return }
    makePayment(paymentInfo)
  }
  
  private func validateForm() -> Bool {
    var isValid = true
    let canNotBeEmptyError = "Can not be empty"
    if form.cardNumber.isEmpty {
      form.cartNumberError = canNotBeEmptyError
      isValid = false
    }
    if form.expired.isEmpty {
      form.expiredError = canNotBeEmptyError
      isValid = false
    }
    if form.cvv.isEmpty {
      form.cvvError = canNotBeEmptyError
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
        form: $form,
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
