//
//  ContentView.swift
//  AdvancedSwiftUIAnimation
//
//  Created by 유재호 on 2022/10/07.
//

//------------------------------------------------------------------------
// The SwiftUI Lab: Advanced SwiftUI Animations
// https://swiftui-lab.com/swiftui-animations-part1 (Animating Paths)
// https://swiftui-lab.com/swiftui-animations-part2 (GeometryEffect)
// https://swiftui-lab.com/swiftui-animations-part3 (AnimatableModifier)
//------------------------------------------------------------------------

import SwiftUI

struct ContentView: View {

  var body: some View {
    NavigationView {
      List {
        Section(header: Text("Part 1: Path Animations")) {
          NavigationLink(destination: Example1(), label: {
            Text("Example 1 (sides: Double)")
          })

          NavigationLink(destination: Example2(), label: {
            Text("Example 2 (sides: Int)")
          })

          NavigationLink(destination: Example3(), label: {
            Text("Example 3 (sides & scale)")
          })

          NavigationLink(destination: Example4(), label: {
            Text("Example 4 (vertex to vertex)")
          })

          NavigationLink(destination: Example5(), label: {
            Text("Example 5 (clock)")
          })

          NavigationLink(destination: Example6(), label: {
            Text("Example 6 (metal)")
          })
        }

        Section(header: Text("Part 2: Geometry Effect")) {
          NavigationLink(destination: Example7(), label: {
            Text("Example 7 (skew)")
          })

          NavigationLink(destination: Example8(), label: {
            Text("Example 8 (rotating card)")
          })

          NavigationLink(destination: Example9(), label: {
            Text("Example 9 (follow path)")
          })
        }
//
//        Section(header: Text("Part 3: Animatable Modifier")) {
//          NavigationLink(destination: Example10(), label: {
//            Text("Example 10 (progress indicator)")
//          })
//
//          NavigationLink(destination: Example11(), label: {
//            Text("Example 11 (gradient)")
//          })
//
//          NavigationLink(destination: Example12(), label: {
//            Text("Example 12 (wave text)")
//          })
//
//          NavigationLink(destination: Example13(), label: {
//            Text("Example 13 (counter)")
//          })
//
//          NavigationLink(destination: Example14(), label: {
//            Text("Example 14 (animatable text color)")
//          })
//        }
      }.navigationBarTitle("SwiftUI Lab")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
