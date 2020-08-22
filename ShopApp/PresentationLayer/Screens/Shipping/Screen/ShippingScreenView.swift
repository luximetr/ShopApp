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
    VStack(spacing: 25) {
      fullNameInputView
      addressInputView
      HStack {
        cityInputView
        zipCodeInputView
      }
      countryInputView
      shippingMethodInputView
      Spacer()
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
    TextField("Full Name", text: $form.fullName)
  }
  
  private var addressInputView: some View {
    TextField("Address", text: $form.address)
  }
  
  private var cityInputView: some View {
    TextField("City", text: $form.city)
  }
  
  private var zipCodeInputView: some View {
    TextField("Zip Code", text: $form.zipCode)
      .padding(.leading, 10)
  }
  
  private var countryInputView: some View {
    TextField("Country", text: $form.country)
  }
  
  private var shippingMethodInputView: some View {
    TextField("Shipping Method", text: $form.shippingMethod)
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
