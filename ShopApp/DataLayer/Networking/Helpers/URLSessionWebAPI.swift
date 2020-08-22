//
//  URLSessionWebAPI.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 11/4/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

let webAPIDelay: Double = 0

class URLSessionWebAPI {
  
  // MARK: - Dependencies
  
  let session: URLSession
  private let requestComposer: URLRequestComposer
  private let failureConvertor = WebAPIFailureConvertor()
  
  // MARK: - Life cycle
  
  init() {
    self.session = .shared
    self.requestComposer = URLRequestComposer(baseURL: "baseURL://")
  }
  
  // MARK: - Create request
  
  func createURLRequest(
      endpoint: String,
      httpMethod: String,
      customHeaders: [String: String] = [:],
      params: [String: Any] = [:]
  ) -> URLRequest {
    return createURLRequest(
      endpoint: endpoint,
      httpMethod: httpMethod,
      customHeaders: customHeaders,
      contentType: "application/json",
      body: try? JSONSerialization.data(withJSONObject: params))
  }
  
  func createURLRequest(
      endpoint: String,
      httpMethod: String,
      customHeaders: [String: String] = [:],
      contentType: String,
      body: Data?
  ) -> URLRequest {
    var request = requestComposer.createRequest(
      endpoint: endpoint,
      customHeaders: customHeaders,
      contentType: contentType)
    request.httpMethod = httpMethod
    request.httpBody = body
    return request
  }
  
  // MARK: - Parse webAPIError
  
  func parseFailure(json: JSON) -> WebAPIFailure {
    return failureConvertor.toFailure(json: json)
  }
  
  func parseFailure(error: Error?) -> WebAPIFailure {
    return failureConvertor.toFailure(error: error)
  }
}
