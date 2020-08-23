//
//  PaymentSuccessScreenView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct PaymentSuccessScreenView: View {
  
  var onContinue: () -> Void
  
  var body: some View {
    VStack {
      titleView
      subtitleView
      Spacer()
      continueButton
    }
    .padding(.all, 24)
  }
  
  private var titleView: some View {
    Text("Congrat!")
      .multilineTextAlignment(.center)
      .font(.font(ofSize: 26, weight: .bold))
      .foregroundColor(appearance.text.primary)
      .padding(.top, 120)
  }
  
  private var subtitleView: some View {
    Text("Thank you for purchasing. Your order will be shipped in 2-4 working days")
      .multilineTextAlignment(.center)
      .font(.font(ofSize: 16))
      .foregroundColor(appearance.text.secondary)
      .padding(.top, 15)
  }
  
  private var continueButton: some View {
    Button("Continue shopping", action: onContinue)
      .buttonStyle(PrimaryButtonStyle())
  }
}

struct PaymentSuccessScreenView_Previews: PreviewProvider {
  static var previews: some View {
    PaymentSuccessScreenView(onContinue: {})
  }
}
