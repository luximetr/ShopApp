//
//  GetCategoriesWebAPI.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 28/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class GetCategoriesWebAPI: URLSessionWebAPIWorker {
  
  func getCategories(completion: @escaping Completion) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
      completion(.success(self.createMockCategories()))
    })
  }
  
  private func createMockCategories() -> [Category] {
    return [
      Category(name: "Smartphones"),
      Category(name: "Laptops"),
      Category(name: "Earphones")
    ]
  }
  
  typealias Completion = (WebAPIResult<[Category]>) -> Void
}
