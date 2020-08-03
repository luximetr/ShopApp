//
//  GetProductsWebAPI.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class GetProductsWebAPI: URLSessionWebAPI {
  
  func getProducts(categoryId: CategoryIdType, completion: @escaping Completion) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
      completion(.success(self.createProducts(categoryId: categoryId)))
    })
  }
  
  private func createProducts(categoryId: CategoryIdType) -> [Product] {
    switch categoryId {
      case CategoryId.earphones.rawValue: return mockEarphoneProducts
      case CategoryId.smartphones.rawValue: return mockSmartphoneProducts
      case CategoryId.laptops.rawValue: return mockLaptopProducts
      default: return []
    }
  }
  
  typealias Completion = (WebAPIResult<[Product]>) -> Void
}
