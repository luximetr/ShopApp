//
//  ActivityIndicator.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 3/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
  
  let style: UIActivityIndicatorView.Style
  
  func makeUIView(context: Context) -> UIActivityIndicatorView {
    return UIActivityIndicatorView(style: style)
  }
  
  func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    uiView.startAnimating()
  }
}
