//
//  WebAPIFailure.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 1/5/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

enum WebAPIFailure {
  case request(WebAPIRequestError)
  case response(WebAPIResponseError)
}
