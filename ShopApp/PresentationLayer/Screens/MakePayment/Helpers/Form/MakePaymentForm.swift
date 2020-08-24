//
//  MakePaymentForm.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 22/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import Foundation

struct MakePaymentScreenForm {
  var cardNumber: String = ""
  var cartNumberError: String = ""
  var expired: String = ""
  var expiredError: String = ""
  var cvv: String = ""
  var cvvError: String = ""
  var cvvNumber: NSNumber = 0
}
