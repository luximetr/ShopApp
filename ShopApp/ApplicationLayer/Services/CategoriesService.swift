//
//  CategoriesService.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class CategoriesService {
  
  // Dependencies
  
  private let getCategoriesWebAPI: GetCategoriesWebAPI
  
  // Life cycle
  init() {
    self.getCategoriesWebAPI = GetCategoriesWebAPI()
  }
  
  // Get categories
  func getCategories(completion: @escaping GetCategoriesCompletion) {
    getCategoriesWebAPI.getCategories(completion: { webAPIResult in
      let serviceResult = ServiceResultConvertor().toServiceResult(webAPIResult)
      completion(serviceResult)
    })
  }
  
  // Typealiases
  typealias GetCategoriesCompletion = (ServiceResult<[Category]>) -> Void
}
