//
//  WebAPIResponseErrorFactory.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 1/5/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

class WebAPIResponseErrorFactory {
  
  func createUnknown() -> WebAPIResponseError {
    return WebAPIResponseError(code: .unknown, message: "Unknown error")
  }
  
}
