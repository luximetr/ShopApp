//
//  GetCategoriesWebAPI.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 28/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation


class GetCategoriesWebAPI: URLSessionWebAPI {
  
  func getCategories(completion: @escaping Completion) {
    DispatchQueue.main.asyncAfter(deadline: .now() + webAPIDelay, execute: {
      completion(.success(mockCategories))
    })
  }
  
  typealias Completion = (WebAPIResult<[Category]>) -> Void
}
