//
//  MakePaymentScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct MakePaymentScreenView: View {
  
  @Binding var form: MakePaymentScreenForm
  @Binding var totalAmount: Decimal
  private let priceFormatter = PriceFormatter()
  var onContinue: () -> Void
  
  var body: some View {
    VStack(spacing: 30) {
      TextField("XXXX XXXX XXXX XXXX", text: $form.cardNumber)
      HStack {
        TextField("MM", text: $form.expiredMonth)
          .frame(width: 30)
        Text("/").foregroundColor(appearance.text.secondary)
        TextField("YY", text: $form.expiredYear)
          .frame(width: 30)
        Spacer()
      }
      TextField("CVV", text: $form.cvv)
      Spacer()
      totalAmountView
      continueButton
    }
    .onTapGesture {
      self.hideKeyboard()
    }
    .autocapitalization(.none)
    .disableAutocorrection(true)
    .padding(.all, 24)
    .navigationBarTitle("Payment")
  }
  
  private var totalAmountView: some View {
    HStack {
      Text("Total Amount")
        .font(.font(ofSize: 15, weight: .semiBold))
        .foregroundColor(appearance.text.secondary)
      Spacer()
      Text((priceFormatter.format(amount: totalAmount)))
        .font(.font(ofSize: 20, weight: .bold))
    }
    .padding(.bottom, 16)
  }
  
  private var continueButton: some View {
    Button("Confirm", action: onContinue)
      .buttonStyle(PrimaryButtonStyle())
  }
}

struct MakePaymentScreenView_Previews: PreviewProvider {
  @State static var form = MakePaymentScreenForm()
  @State static var totalAmount: Decimal = 1234
  static var previews: some View {
    NavigationView {
      MakePaymentScreenView(
        form: $form,
        totalAmount: $totalAmount,
        onContinue: {}
      )
    }
  }
}
