//
//  PaymentSuccessScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct PaymentSuccessScreen: View {
  
  @EnvironmentObject var cart: Cart
  @Environment(\.presentationMode) private var presentationMode
  
  private func onContinue() {
    updateIsCartPresentedPublisher.send(false)
  }
  
  private func onAppear() {
    cart.clear()
  }
  
  var body: some View {
    PaymentSuccessScreenView(onContinue: onContinue)
    .onAppear(perform: onAppear)
  }
}

struct PaymentSuccessScreen_Previews: PreviewProvider {
  static var previews: some View {
    PaymentSuccessScreen()
  }
}
