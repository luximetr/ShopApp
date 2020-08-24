//
//  ShippingScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 20/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ShippingScreen: View {
  
  @State var form = mockShippingScreenForm// ShippingScreenForm()
  @State var needShowMakePayment = false
  
  private let convertor = ShippingScreenFormConvertor()
  
  private func onContinue() {
    guard validateForm() else { return }
    needShowMakePayment = true
  }
  
  private func validateForm() -> Bool {
    var isValid = true
    let canNotBeEmptyError = "Required"
    if form.fullName.isEmpty {
      form.fullNameError = canNotBeEmptyError
      isValid = false
    }
    if form.address.isEmpty {
      form.addressError = canNotBeEmptyError
      isValid = false
    }
    if form.city.isEmpty {
      form.cityError = canNotBeEmptyError
      isValid = false
    }
    if form.zipCode.isEmpty {
      form.zipCodeError = canNotBeEmptyError
      isValid = false
    }
    if form.country.isEmpty {
      form.countryError = canNotBeEmptyError
      isValid = false
    }
    if form.shippingMethod.isEmpty {
      form.shippingMethodError = canNotBeEmptyError
      isValid = false
    }
    return isValid
  }
  
  var body: some View {
    ZStack {
      ShippingScreenView(
        form: $form,
        onContinue: onContinue
      )
      NavigationLink(
        destination:
          MakePaymentScreen(
            shippingInfo: convertor.toShippingInfo(form: form)),
        isActive: $needShowMakePayment) { EmptyView() }
    }
  }
}

struct ShippingScreen_Previews: PreviewProvider {
  static var previews: some View {
    ShippingScreen()
  }
}
