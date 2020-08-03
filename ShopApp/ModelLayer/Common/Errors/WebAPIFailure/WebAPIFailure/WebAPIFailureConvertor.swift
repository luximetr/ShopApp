//
//  WebAPIFailureConvertor.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 1/5/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

class WebAPIFailureConvertor {
  
  // MARK: - Dependencies
  
  private let requestErrorFactory = WebAPIRequestErrorFactory()
  private let responseErrorJSONConvertor = WebAPIResponseErrorJSONConvertor()
  
  // MARK: - JSON -> WebAPIFailure
  
  func toFailure(json: JSON) -> WebAPIFailure {
    guard let errorJSON = json["error"] as? JSON else {
      return createCanNotParse()
    }
    guard let responseError = responseErrorJSONConvertor.toError(json: errorJSON) else {
      return createCanNotParse()
    }
    return .response(responseError)
  }
  
  // MARK: - Error -> WebAPIFailure
  
  func toFailure(error: Error?) -> WebAPIFailure {
    guard let nsError = error as NSError? else {
      return createUnknownRequest()
    }
    return createRequestError(nsError)
  }
  
  // MARK: - Create error
  
  private func createCanNotParse() -> WebAPIFailure {
    let error = requestErrorFactory.createCanNotParseResponse()
    return .request(error)
  }
  
  // MARK: - Create unknown request error
  
  private func createUnknownRequest() -> WebAPIFailure {
    let error = requestErrorFactory.createUnknown()
    return .request(error)
  }
  
  // MARK: - Create request error
  
  private func createRequestError(_ error: NSError) -> WebAPIFailure {
    let error = WebAPIRequestError(
      code: error.code,
      message: error.localizedDescription)
    return .request(error)
  }
  
}
