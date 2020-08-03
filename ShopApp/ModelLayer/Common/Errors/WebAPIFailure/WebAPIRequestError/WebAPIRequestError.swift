//
//  WebAPIRequestError.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 1/5/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

struct WebAPIRequestError: Error {
  
  let code: Int
  let message: String
  
  var isInternetConnectionError: Bool {
    return
      code == NSURLErrorNetworkConnectionLost ||
      code == NSURLErrorNotConnectedToInternet
  }
}
