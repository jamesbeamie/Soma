//
//  ContentView.swift
//  Soma
//
//  Created by James on 2/26/20.
//  Copyright © 2020 James. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack{
                Text("Active size Class")
                Text("Compact")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack {
                Text("Active size Class")
                Text("Regular")
            }
            .font(.largeTitle))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
