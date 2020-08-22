//
//  ShippingScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 20/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ShippingScreen: View {
  
  @State var form = ShippingScreenForm()
  @State var needShowMakePayment = false
  
  private func onContinue() {
    needShowMakePayment = true
  }
  
  var body: some View {
    ZStack {
      ShippingScreenView(
        form: $form,
        onContinue: onContinue
      )
      NavigationLink(
        destination: MakePaymentScreen(),
        isActive: $needShowMakePayment) { EmptyView() }
    }
  }
}

struct ShippingScreen_Previews: PreviewProvider {
  static var previews: some View {
    ShippingScreen()
  }
}
