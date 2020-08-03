//
//  ServiceErrorConvertor.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 1/5/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

class ServiceErrorConvertor {
  
  // MARK: - WebAPIFailure -> ServiceError
  
  func toError(failure: WebAPIFailure) -> ServiceError {
    switch failure {
    case .request(let requestError):
      return ServiceError(message: requestError.message)
    case .response(let responseError):
      return ServiceError(message: responseError.message)
    }
  }
  
  // MARK: - WebAPIRequestError -> ServiceError
  
  func toError(requestError: WebAPIRequestError) -> ServiceError {
    return ServiceError(message: requestError.message)
  }
  
  // MARK: - WebAPIResponseError -> ServiceError
  
  func toError(responseError: WebAPIResponseError) -> ServiceError {
    return ServiceError(message: responseError.message)
  }
}
