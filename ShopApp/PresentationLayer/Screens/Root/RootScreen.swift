//
//  RootScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI
import Combine

struct RootScreen: View {
  
  @State var isCartPresented: Bool = false
  @ObservedObject var cart = mockCart// Cart()
  
  var body: some View {
    CategoriesListScreen()
      .environmentObject(cart)
      .sheet(isPresented: self.$isCartPresented) {
        CartItemsListScreen()
          .environmentObject(self.cart)
      }
      .onReceive(
        updateIsCartPresentedPublisher.receive(on: DispatchQueue.main),
        perform: { needPresent in
          self.isCartPresented = needPresent
      })
  }
}

let updateIsCartPresentedPublisher = PassthroughSubject<Bool, Never>()

struct RootScreen_Previews: PreviewProvider {
  static var previews: some View {
    RootScreen()
  }
}
