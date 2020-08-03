//
//  URLRequestComposer.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 11/4/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

class URLRequestComposer {
  
  // MARK: - Dependencies
  
  private let baseURL: String
  
  // MARK: - Life cycle
  
  init(baseURL: String) {
    self.baseURL = baseURL
  }
  
  // MARK: - Create request
  
  func createRequest(
      endpoint: String,
      customHeaders: [String: String],
      contentType: String) -> URLRequest {
    let url = URL(string: baseURL + "/" + endpoint)!
    var request = URLRequest(url: url)
    request.addValue(contentType, forHTTPHeaderField: "Content-Type")
    for (_, (headerKey, headerValue)) in customHeaders.enumerated() {
      request.addValue(headerValue, forHTTPHeaderField: headerKey)
    }
    return request
  }
}
