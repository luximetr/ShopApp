//
//  ServiceResultConvertor.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 12/4/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

class ServiceResultConvertor {
  
  // MARK: - Dependencies
  
  private let errorConvertor = ServiceErrorConvertor()
  
  // MARK: - WebAPIResult -> ServiceResult
  
  func toServiceResult<T>(_ webAPIResult: WebAPIResult<T>) -> ServiceResult<T> {
    switch webAPIResult {
    case .success(let value):
      return .success(value)
    case .failure(let failure):
      let serviceError = errorConvertor.toError(failure: failure)
      return .failure(serviceError)
    }
  }
  
}
