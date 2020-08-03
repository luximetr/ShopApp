//
//  WebAPIResult.swift
//  CVApp
//
//  Created by Oleksandr Orlov on 11/4/20.
//  Copyright © 2020 Oleksandr Orlov. All rights reserved.
//

import Foundation

enum WebAPIResult<T> {
  case success(T)
  case failure(WebAPIFailure)
}
