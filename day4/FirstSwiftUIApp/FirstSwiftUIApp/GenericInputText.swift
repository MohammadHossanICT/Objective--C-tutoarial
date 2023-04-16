//
//  GenericInputText.swift
//  FirstSwiftUIApp
//
//  Created by Christian Quicano on 3/1/22.
//

import SwiftUI

struct GenericInputText: View {
    
    @Binding private(set) var currentText: String
    
    var body: some View {
        TextField("user input", text: $currentText)
    }
}

struct GenericInputText_Previews: PreviewProvider {
    static var previews: some View {
        GenericInputText(currentText: .constant("string"))
    }
}
