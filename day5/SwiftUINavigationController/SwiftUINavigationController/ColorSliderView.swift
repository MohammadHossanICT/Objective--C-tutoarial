//
//  ColorSliderView.swift
//  SwiftUINavigationController
//
//  Created by Christian Quicano on 3/2/22.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
                .foregroundColor(textColor)
        }
        .padding(.horizontal)
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: Binding.constant(0.5), textColor: .red)
    }
}
