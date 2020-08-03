//
//  WebAPIResponseErrorJSONConvertor.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 1/5/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

class WebAPIResponseErrorJSONConvertor {
  
  // MARK: - JSON -> WebAPIResponseError
  
  func toError(json: JSON) -> WebAPIResponseError? {
    guard let message = json["message"] as? String else { return nil }
    let code = parseCode(json: json)
    return WebAPIResponseError(code: code, message: message)
  }
  
  // MARK: - Parse code
  
  private func parseCode(json: JSON) -> WebAPIResponseErrorCode {
    guard let codeRawValue = json["code"] as? WebAPIResponseErrorCode.RawValue else { return .unknown }
    return WebAPIResponseErrorCode(rawValue: codeRawValue) ?? .unknown
  }
  
}
