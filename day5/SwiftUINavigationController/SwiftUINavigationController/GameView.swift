//
//  GameView.swift
//  SwiftUINavigationController
//
//  Created by Christian Quicano on 3/2/22.
//

import SwiftUI

struct GameView: View {
    
    private let rTarget = Double.random(in: 0..<1)
    private let gTarget = Double.random(in: 0..<1)
    private let bTarget = Double.random(in: 0..<1)
    
    @State private var rGuess = Double.random(in: 0..<1)
    @State private var gGuess = Double.random(in: 0..<1)
    @State private var bGuess = Double.random(in: 0..<1)
    
    var body: some View {
        VStack {
            Text("Game")
            HStack(alignment: .center, spacing: 10) {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R: \(Int(rGuess * 255.0)) G: \(Int(gGuess * 255.0)) B: \(Int(bGuess * 255.0))")
                }
            }
            Button {
            } label: {
                Text("Hit me!")
            }
            ColorSliderView(value: $rGuess, textColor: .red)
            ColorSliderView(value: $gGuess, textColor: .green)
            ColorSliderView(value: $bGuess, textColor: .blue)
        }
        .onAppear {
            print("on appear")
        }
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
