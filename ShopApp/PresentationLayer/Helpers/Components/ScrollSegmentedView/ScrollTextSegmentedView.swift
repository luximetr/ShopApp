//
//  ScrollTextSegmentedView.swift
//  ShopApp
//
//  Created by Oleksandr Orlov on 27/7/20.
//  Copyright © 2020 Deskera. All rights reserved.
//

import SwiftUI

struct ScrollTextSegmentedView: View {
  
  @Binding var selectedIndex: Int
  let data: [String]
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 16) {
        ForEach(0..<data.count, id: \.self) { index in
          TextItem(
            self.data[index],
            isHightlighted: self.selectedIndex == index
            )
            .onTapGesture {
              self.selectedIndex = index
            }
        }
      }.padding([.leading, .trailing], 16)
    }
  }
}

private struct TextItem: View {
  
  var isHightlighted: Bool
  var title: String
  
  init(_ title: String, isHightlighted: Bool = false) {
    self.title = title
    self.isHightlighted = isHightlighted
  }
  
  var body: some View {
    HStack {
      Text(title)
        .foregroundColor(
          self.isHightlighted ? appearance.text.primary : appearance.text.secondary)
        .font(.font(ofSize: 24, weight: .bold))
    }
  }
}

struct ScrollTextSegmentedView_Previews: PreviewProvider {
  @State static var index = 1
  static var previews: some View {
    ScrollTextSegmentedView(selectedIndex: $index, data: ["Category 1", "Tab2", "Tab3", "Tab4", "Tab5"])
  }
}
