//
//  View+Extension.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 20/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
