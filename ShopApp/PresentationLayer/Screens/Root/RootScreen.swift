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
  @ObservedObject var cart = Cart()
  
  var body: some View {
    CategoriesListScreen()
      .environmentObject(cart)
      .sheet(isPresented: self.$isCartPresented) {
        CartItemsListScreen()
          .environmentObject(self.cart)
      }
      .onReceive(updateIsCartPresentedPublisher, perform: { needPresent in
        self.isCartPresented = needPresent
      })
  }
}

//extension Notification.Name {
//  static let updateIsCartPresented = Notification.Name(rawValue: "updateIsCartPresented")
//}
let updateIsCartPresentedPublisher = PassthroughSubject<Bool, Never>()
//private let updateIsCartPresentedPublisher = NotificationCenter.Publisher(center: .default, name: .updateIsCartPresented)

struct RootScreen_Previews: PreviewProvider {
  static var previews: some View {
    RootScreen()
  }
}
