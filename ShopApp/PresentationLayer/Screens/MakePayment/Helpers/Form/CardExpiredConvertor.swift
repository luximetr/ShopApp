//
//  CardExpiredConvertor.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 26/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

class CardExpiredConvertor {
  
  func toExpired(_ string: String) -> (month: Int, year: Int)? {
    let divider: Character = "/"
    guard string.contains(divider) else { return nil }
    let components = string.split(separator: divider)
    guard components.count == 2 else { return nil }
    guard let month = Int(components[0]) else { return nil }
    guard let year = Int(components[1]) else { return nil }
    return (month, year)
  }
}
