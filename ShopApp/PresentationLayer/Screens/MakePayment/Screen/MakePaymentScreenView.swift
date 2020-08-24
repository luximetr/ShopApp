//
//  MakePaymentScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI
import Combine

struct NumberTextField: View {
  init(_ title: String, value: Binding<NSNumber>, formatter: NumberFormatter) {
    self.title = title
    self.stringTransformer = StringTransformer(value, formatter: formatter)
  }
  
  private let title: String
  @ObservedObject private var stringTransformer: StringTransformer
  
  var body: some View {
    TextField(title, text: $stringTransformer.stringValue)
  }
}

final class StringTransformer: ObservableObject {
  
  @Published var stringValue: String = ""
  private var cancellable: AnyCancellable?
  
  init(_ value: Binding<NSNumber>, formatter: NumberFormatter) {
    // NSNumber -> String
    stringValue = formatter.string(from: value.wrappedValue) ?? ""
    
    // String -> NSNumber
    cancellable = $stringValue.dropFirst().receive(on: RunLoop.main)
      .sink(receiveValue: { [weak self] (editingString) in
        if let number = formatter.number(from: editingString) {
          value.wrappedValue = number
        }
        else if !editingString.isEmpty {
          // Force current model value when editing value is invalid (invalid value or out of range).
          self?.stringValue = formatter.string(from: value.wrappedValue) ?? ""
        }
      })
  }
}

struct MakePaymentScreenView: View {
  
  @Binding var form: MakePaymentScreenForm
  @Binding var totalAmount: Decimal
  private let priceFormatter = PriceFormatter()
  var onContinue: () -> Void
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      UnderlineTextInput("XXXX XXXX XXXX XXXX", text: $form.cardNumber, errorText: $form.cartNumberError)
        .frame(width: 192)
      UnderlineTextInput("MM/YY", text: $form.expired, errorText: $form.expiredError)
        .frame(width: 56)
      NumberTextField("CVV", value: $form.cvvNumber, formatter: PriceFormatter().numberFormatter)
        .frame(width: 234)
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
        .foregroundColor(appearance.text.primary)
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
