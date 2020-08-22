//
//  String+Extension.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

extension String {
  
  func filter(includedIn: CharacterSet) -> String {
    return self.filter({(char) -> Bool in
      return char.unicodeScalars.contains(where: { includedIn.contains($0) })
    })
  }
}
