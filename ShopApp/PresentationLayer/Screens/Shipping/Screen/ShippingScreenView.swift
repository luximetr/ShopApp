//
//  ShippingScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 20/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ShippingScreenView: View {
  
  @Binding var form: ShippingScreenForm
  var onContinue: () -> Void
  
  var body: some View {
    VStack(spacing: 10) {
      fullNameInputView
      addressInputView
      HStack {
        cityInputView
        zipCodeInputView
      }
      countryInputView
      shippingMethodInputView
      appearance.background.primary
      continueButton
    }
    .onTapGesture {
      self.hideKeyboard()
    }
    .autocapitalization(.none)
    .disableAutocorrection(true)
    .padding(.all, 24)
    .navigationBarTitle("Shipping")
  }
  
  private var fullNameInputView: some View {
    UnderlineTextInput("Full Name", text: $form.fullName, errorText: $form.fullNameError)
  }
  
  private var addressInputView: some View {
    UnderlineTextInput("Address", text: $form.address, errorText: $form.addressError)
  }
  
  private var cityInputView: some View {
    UnderlineTextInput("City", text: $form.city, errorText: $form.cityError)
  }
  
  private var zipCodeInputView: some View {
    UnderlineTextInput("Zip Code", text: $form.zipCode, errorText: $form.zipCodeError)
      .padding(.leading, 10)
      .keyboardType(.numberPad)
  }
  
  private var countryInputView: some View {
    UnderlineTextInput("Country", text: $form.country, errorText: $form.countryError)
  }
  
  private var shippingMethodInputView: some View {
    UnderlineTextInput(
      "Shipping Method",
      text: $form.shippingMethod,
      errorText: $form.shippingMethodError,
      onCommit: onContinue
    )
  }
  
  private var continueButton: some View {
    Button("Continue to Payment") {
      self.onContinue()
    }
    .buttonStyle(PrimaryButtonStyle())
  }
}

struct ShippingScreenView_Previews: PreviewProvider {
  @State static var form = ShippingScreenForm()
  static var previews: some View {
    NavigationView {
      ShippingScreenView(
        form: $form,
        onContinue: {}
      )
    }
  }
}
