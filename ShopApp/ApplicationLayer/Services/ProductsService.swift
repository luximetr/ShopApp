//
//  ProductsService.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class ProductsService {
  
  // Dependencies
  
  private let getProductsWebAPI: GetProductsWebAPI
  
  // Life cycle
  
  init() {
    self.getProductsWebAPI = GetProductsWebAPI()
  }
  
  // Get products
  
  func getProducts(categoryId: CategoryIdType, completion: @escaping GetProductsCompletion) {
    getProductsWebAPI.getProducts(categoryId: categoryId, completion: { webAPIResult in
      let serviceResult = ServiceResultConvertor().toServiceResult(webAPIResult)
      completion(serviceResult)
    })
  }
  
  // Typealiases
  
  typealias GetProductsCompletion = (ServiceResult<[Product]>) -> Void
}
