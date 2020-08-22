//
//  CategoriesListScreen.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct CategoriesListScreen: View {
  
  @State var currentPage: Int = 0
  @State var categories: [Category] = []
  @State var isLoading: Bool = false
  @State var dataLoaded: Bool = false
  @State var isCartPresented: Bool = false
  @EnvironmentObject var cart: Cart
  
  private let categoriesService = CategoriesService()
  
  private func viewOnAppear() {
    guard !self.dataLoaded else { return }
    self.isLoading = true
    self.categoriesService.getCategories(completion: { result in
      self.isLoading = false
      self.dataLoaded = true
      switch result {
        case .success(let categories):
          self.categories = categories
        case .failure(let error):
          print(error)
      }
    })
  }
  
  var body: some View {
    NavigationView {
      CategoriesListScreenView(
        categories: $categories,
        isLoading: $isLoading
      )
        .navigationBarTitle("Categories", displayMode: .inline)
        .navigationBarItems(trailing: cartButton)
    }
      .onAppear(perform: {
        self.viewOnAppear()
      })
      .sheet(isPresented: self.$isCartPresented) {
        CartItemsListScreen()
          .environmentObject(self.cart)
      }
      .environmentObject(cart)
  }
  
  private var cartButton: some View {
    CartVolumeButton(
      text: "\(cart.items.count)",
      action: {
        self.isCartPresented = true
    })
  }
}

struct CategoriesListScreen_Previews: PreviewProvider {
  static var previews: some View {
    CategoriesListScreen()
  }
}
