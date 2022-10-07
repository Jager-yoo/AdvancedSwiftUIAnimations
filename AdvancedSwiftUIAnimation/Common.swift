//
//  Common.swift
//  AdvancedSwiftUIAnimation
//
//  Created by 유재호 on 2022/10/07.
//

import SwiftUI

struct MyButton: View {
  let label: String
  var font: Font = .title
  var textColor: Color = .white
  let action: () -> Void
  
  var body: some View {
    Button(action: {
      self.action()
    }, label: {
      Text(label)
        .font(font)
        .padding(10)
        .frame(width: 70)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).shadow(radius: 2))
        .foregroundColor(textColor)
    })
  }
}

struct Common_Previews: PreviewProvider {
  static var previews: some View {
    MyButton(label: "버튼", action: {})
  }
}
