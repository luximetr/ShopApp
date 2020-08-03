//
//  WebAPIRequestErrorFactory.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 1/5/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

class WebAPIRequestErrorFactory {
  
  func createCanNotParseResponse() -> WebAPIRequestError {
    return WebAPIRequestError(
      code: NSURLErrorCannotParseResponse,
      message: "Can not parse response")
  }
  
  func createUnknown() -> WebAPIRequestError {
    return WebAPIRequestError(
      code: NSURLErrorUnknown,
      message: "Unknown")
  }
}
