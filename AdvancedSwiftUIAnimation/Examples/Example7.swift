//
//  Example7.swift
//  AdvancedSwiftUIAnimation
//
//  Created by 유재호 on 2022/10/21.
//

import SwiftUI

// MARK: - Example 7: Skew

struct Example7: View {

  @State private var moveIt = false

  var body: some View {

    let animation = Animation.easeInOut(duration: 1.0)

    return VStack {
      LabelView(
        text: "The SwiftUI Lab",
        offset: moveIt ? 120 : -120,
        pct: moveIt ? 1 : 0,
        backgroundColor: .red)
        .animation(animation, value: self.moveIt)

      LabelView(
        text: "The SwiftUI Lab",
        offset: moveIt ? 120 : -120,
        pct: moveIt ? 1 : 0,
        backgroundColor: .orange)
        .animation(animation.delay(0.1), value: self.moveIt)

      LabelView(
        text: "The SwiftUI Lab",
        offset: moveIt ? 120 : -120,
        pct: moveIt ? 1 : 0,
        backgroundColor: .yellow)
        .animation(animation.delay(0.2), value: self.moveIt)

      LabelView(
        text: "The SwiftUI Lab",
        offset: moveIt ? 120 : -120,
        pct: moveIt ? 1 : 0,
        backgroundColor: .green)
        .animation(animation.delay(0.3), value: self.moveIt)

      LabelView(
        text: "The SwiftUI Lab",
        offset: moveIt ? 120 : -120,
        pct: moveIt ? 1 : 0,
        backgroundColor: .blue)
        .animation(animation.delay(0.4), value: self.moveIt)

      LabelView(
        text: "The SwiftUI Lab",
        offset: moveIt ? 120 : -120,
        pct: moveIt ? 1 : 0,
        backgroundColor: .purple)
        .animation(animation.delay(0.5), value: self.moveIt)

      LabelView(
        text: "The SwiftUI Lab",
        offset: moveIt ? 120 : -120,
        pct: moveIt ? 1 : 0,
        backgroundColor: .pink)
        .animation(animation.delay(0.6), value: self.moveIt)

      Button(action: { self.moveIt.toggle() }) {
        Text("Animate")
      }
      .padding(.top, 50)
    }
    .onTapGesture { self.moveIt.toggle() }
    .navigationBarTitle("Example 7")
  }
}

struct LabelView: View {

  let text: String
  var offset: CGFloat
  var pct: CGFloat
  let backgroundColor: Color

  var body: some View {
    Text(text)
      .font(.headline)
      .padding(5)
      .background(RoundedRectangle(cornerRadius: 5).foregroundColor(backgroundColor))
      .foregroundColor(Color.black)
      .modifier(SkewedOffset(offset: offset, pct: pct, goingRight: offset > 0))
  }
}

struct SkewedOffset: GeometryEffect {

  var offset: CGFloat
  var pct: CGFloat
  let goingRight: Bool

  init(offset: CGFloat, pct: CGFloat, goingRight: Bool) {
    self.offset = offset
    self.pct = pct
    self.goingRight = goingRight
  }

  var animatableData: AnimatablePair<CGFloat, CGFloat> {
    get { return AnimatablePair<CGFloat, CGFloat>(offset, pct) }
    set {
      offset = newValue.first
      pct = newValue.second
    }
  }

  func effectValue(size: CGSize) -> ProjectionTransform {
    var skew: CGFloat

    if pct < 0.2 {
      skew = (pct * 5) * 0.5 * (goingRight ? -1 : 1)
    } else if pct > 0.8 {
      skew = ((1 - pct) * 5) * 0.5 * (goingRight ? -1 : 1)
    } else {
      skew = 0.5 * (goingRight ? -1 : 1)
    }

    return ProjectionTransform(
      CGAffineTransform(a: 1, b: 0, c: skew, d: 1, tx: offset, ty: 0))
  }
}

struct Example7_Previews: PreviewProvider {
  static var previews: some View {
    Example7()
  }
}
