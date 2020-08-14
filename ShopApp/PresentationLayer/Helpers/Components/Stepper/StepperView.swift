//
//  StepperView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 13/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct StepperView: View {
  
  @Binding var count: Int
  private let step = 1
  
  var body: some View {
    HStack {
      decreaseButton
      countText
      increaseButton
    }
  }
  
  private var countText: some View {
    Text("\(count)")
      .font(.font(ofSize: 22, weight: .semiBold))
      .foregroundColor(appearance.text.primary)
      .frame(width: 30)
  }
  
  private var decreaseButton: some View {
    createButton("-") {
      self.count -= self.step
    }
  }
  
  private var increaseButton: some View {
    createButton("+") {
      self.count += self.step
    }
  }
  
  private func createButton(_ text: String, _ action: @escaping () -> Void) -> some View {
    Button(action: {
      action()
    }) {
      Text(text)
        .offset(y: -2)
        .font(.font(ofSize: 26, weight: .medium))
        .frame(width: 30, height: 30)
        .foregroundColor(appearance.action.secondary.title)
        .overlay(
          RoundedRectangle(cornerRadius: 15)
            .stroke(appearance.action.secondary.background, lineWidth: 2)
        )
    }
    .buttonStyle(BorderlessButtonStyle())
  }
  
}

struct StepperView_Previews: PreviewProvider {
  @State static var count = 10
  static var previews: some View {
    StepperView(count: $count)
  }
}
