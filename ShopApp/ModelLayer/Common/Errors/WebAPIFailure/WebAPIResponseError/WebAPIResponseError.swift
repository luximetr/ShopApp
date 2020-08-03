//
//  WebAPIResponseError.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 1/5/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

struct WebAPIResponseError: Error {
  
  let code: WebAPIResponseErrorCode
  let message: String
  
}
