//
//  UnderlineTextInput.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 23/8/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct UnderlineTextInput: View {
  
  @Binding var text: String
  @Binding var errorText: String
  var placeholder: String = ""
  private var onCommit: () -> Void
  
  init(_ placeholder: String = "",
       text: Binding<String>,
       errorText: Binding<String>,
       onCommit: @escaping () -> Void = {}) {
    self.placeholder = placeholder
    self._text = text
    self._errorText = errorText
    self.onCommit = onCommit
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      TextField(
        placeholder,
        text: $text,
        onEditingChanged: { _ in
          self.errorText = ""
        },
        onCommit: {
          self.onCommit()
      }
      )
      Divider()
        .frame(height: 1)
        .background(dividerColor)
      if !errorText.isEmpty {
        Text(errorText)
          .foregroundColor(appearance.text.disruptive)
          .font(.font(ofSize: 13))
      }
      Spacer()
        .frame(minHeight: 0)
    }
    .frame(minWidth: 0, maxWidth: .infinity)
    .frame(maxHeight: 40)
  }
  
  private var dividerColor: Color {
    errorText.isEmpty ?
      appearance.divider.primary.background :
      appearance.divider.disruptive.background
  }
}

struct ErrorTextInput_Previews: PreviewProvider {
  @State static var text1: String = ""
  @State static var errorText1: String = "Error"
  @State static var text2: String = ""
  @State static var errorText2: String = ""
  
  static var previews: some View {
    VStack {
      VStack(spacing: 10) {
        UnderlineTextInput("Placeholder", text: $text1, errorText: $errorText1)
        UnderlineTextInput("Placeholder", text: $text2, errorText: $errorText2)
      }
      Button("Test") {
        
      }
    }
  }
}
