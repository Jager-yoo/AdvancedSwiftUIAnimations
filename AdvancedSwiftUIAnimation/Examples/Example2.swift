//
//  Example2.swift
//  AdvancedSwiftUIAnimation
//
//  Created by 유재호 on 2022/10/07.
//

import SwiftUI

// MARK: - Example 2: Polygon with sides as Integer

struct Example2: View {
  
  @State private var sides: Int = 4
  private let duration: Double = 1.0

  var body: some View {
    VStack {
      Example2PolygonShape(sides: sides)
        .stroke(Color.red, lineWidth: 3)
        .padding(20)
        .animation(.easeInOut(duration: duration), value: sides)
        .layoutPriority(1)

      Text("\(Int(sides)) sides").font(.headline)

      HStack(spacing: 20) {
        MyButton(label: "1") {
          self.sides = 1
        }

        MyButton(label: "3") {
          self.sides = 3
        }

        MyButton(label: "7") {
          self.sides = 7
        }

        MyButton(label: "30") {
          self.sides = 30
        }
      }.navigationBarTitle("Example 2").padding(.bottom, 50)
    }
  }
}

struct Example2PolygonShape: Shape {
  var sides: Int
  private var sidesAsDouble: Double

  var animatableData: Double {
    get { return sidesAsDouble }
    set { sidesAsDouble = newValue }
  }

  init(sides: Int) {
    self.sides = sides
    self.sidesAsDouble = Double(sides)
  }

  func path(in rect: CGRect) -> Path {

    // hypotenuse
    let h = Double(min(rect.size.width, rect.size.height)) / 2.0

    // center
    let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)

    var path = Path()

    let extra: Int = sidesAsDouble != Double(Int(sidesAsDouble)) ? 1 : 0

    for i in 0..<Int(sidesAsDouble) + extra {
      let angle = (Double(i) * (360.0 / sidesAsDouble)) * Double.pi / 180

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

struct Example2_Previews: PreviewProvider {
  static var previews: some View {
    Example2()
  }
}
