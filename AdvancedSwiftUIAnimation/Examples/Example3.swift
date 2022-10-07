//
//  Example3.swift
//  AdvancedSwiftUIAnimation
//
//  Created by 유재호 on 2022/10/07.
//

import SwiftUI

// MARK: - Example 3: Polygon with multiple animatable paramters

struct Example3: View {

  @State private var sides: Double = 4
  @State private var scale: Double = 1.0
  private let duration: Double = 1.0

  var body: some View {
    VStack {
      Example3PolygonShape(sides: sides, scale: scale)
        .stroke(Color.purple, lineWidth: 5)
        .padding(20)
        // AnimatablePair 로 묶여있기 때문에, sides, scale 둘 중 하나만 애니메이션 걸어도, 같이 애니메이팅 됨.
        .animation(.easeInOut(duration: duration), value: sides)
        .layoutPriority(1)

      Text("\(Int(sides)) sides, \(String(format: "%.2f", scale as Double)) scale")

      HStack(spacing: 20) {
        MyButton(label: "1") {
          self.sides = 1.0
          self.scale = 1.0
        }

        MyButton(label: "3") {
          self.sides = 3.0
          self.scale = 0.7
        }

        MyButton(label: "7") {
          self.sides = 7.0
          self.scale = 0.4
        }

        MyButton(label: "30") {
          self.sides = 30.0
          self.scale = 1.0
        }
      }
    }.navigationBarTitle("Example 3").padding(.bottom, 50)
  }
}


struct Example3PolygonShape: Shape {
  var sides: Double
  var scale: Double

  var animatableData: AnimatablePair<Double, Double> {
    get { AnimatablePair(sides, scale) }
    set {
      sides = newValue.first
      scale = newValue.second
    }
  }

  func path(in rect: CGRect) -> Path {
    // hypotenuse
    let h = Double(min(rect.size.width, rect.size.height)) / 2.0 * scale

    // center
    let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)

    var path = Path()

    let extra: Int = sides != Double(Int(sides)) ? 1 : 0

    for i in 0..<Int(sides) + extra {
      let angle = (Double(i) * (360.0 / sides)) * (Double.pi / 180)

      // Calculate vertex
      let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))

      if i == 0 {
        path.move(to: pt) // move to first vertex
      } else {
        path.addLine(to: pt) // draw line to next vertex
      }
    }

    path.closeSubpath()

    return path
  }
}

struct Example3_Previews: PreviewProvider {
  static var previews: some View {
    Example3()
  }
}
