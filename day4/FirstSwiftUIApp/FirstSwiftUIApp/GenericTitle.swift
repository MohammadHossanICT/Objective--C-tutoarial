//
//  GenericTitle.swift
//  FirstSwiftUIApp
//
//  Created by Christian Quicano on 3/1/22.
//

import SwiftUI

struct GenericTitle: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .font(.title)
    }
}

struct GenericTitle_Previews: PreviewProvider {
    static var previews: some View {
        GenericTitle(text: "Generic Title")
    }
}
