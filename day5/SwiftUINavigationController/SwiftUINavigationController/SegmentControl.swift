//
//  SegmentControl.swift
//  SwiftUINavigationController
//
//  Created by Christian Quicano on 3/2/22.
//

import SwiftUI

struct SegmentControl: View {
    
    @Binding var indexSelected: Int
    
    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $indexSelected) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }
            .pickerStyle(.segmented)

            Text("Value: \(indexSelected)")
            Spacer()
        }
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentControl(indexSelected: .constant(0))
    }
}
