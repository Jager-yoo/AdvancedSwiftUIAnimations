//
//  Example4.swift
//  AdvancedSwiftUIAnimation
//
//  Created by 유재호 on 2022/10/07.
//

import SwiftUI

// MARK: - Example 4: Polygon with lines vertex-to-vertex

struct Example4: View {

  @State private var sides: Double = 4
  @State private var scale: Double = 1.0

  var body: some View {
    VStack {
      Example4PolygonShape(sides: sides, scale: scale)
        .stroke(Color.pink, lineWidth: (sides < 3) ? 10 : ( sides < 7 ? 5 : 2))
        .padding(20)
        .animation(.easeInOut(duration: 3.0), value: sides)
        .layoutPriority(1)

      Text("\(Int(sides)) sides, \(String(format: "%.2f", scale as Double)) scale")

      Slider(value: $sides, in: 0...30)

      HStack(spacing: 20) {
        MyButton(label: "1") {
          self.sides = 1.0
          self.scale = 1.0
        }

        MyButton(label: "3") {
          self.sides = 3.0
          self.scale = 1.0
        }

        MyButton(label: "7") {
          self.sides = 7.0
          self.scale = 1.0
        }

        MyButton(label: "30") {
          self.sides = 30.0
          self.scale = 1.0
        }
      }
    }.navigationBarTitle("Example 4").padding(.bottom, 50)
  }
}


struct Example4PolygonShape: Shape {
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

    var vertex: [CGPoint] = []

    for i in 0..<Int(sides) + extra {

      let angle = (Double(i) * (360.0 / sides)) * (Double.pi / 180)

      // Calculate vertex
      let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))

      vertex.append(pt)

      if i == 0 {
        path.move(to: pt) // move to first vertex
      } else {
        path.addLine(to: pt) // draw line to next vertex
      }
    }

    path.closeSubpath()

    // Draw vertex-to-vertex lines
    drawVertexLines(path: &path, vertex: vertex, n: 0)

    return path
  }

  func drawVertexLines(path: inout Path, vertex: [CGPoint], n: Int) {

    if (vertex.count - n) < 3 { return }

    for i in (n+2)..<min(n + (vertex.count-1), vertex.count) {
      path.move(to: vertex[n])
      path.addLine(to: vertex[i])
    }

    drawVertexLines(path: &path, vertex: vertex, n: n+1)
  }
}


struct Example4_Previews: PreviewProvider {
  static var previews: some View {
    Example4()
  }
}
