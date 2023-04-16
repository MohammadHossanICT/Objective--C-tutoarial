//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Christian Quicano on 3/1/22.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let value: Int
}

struct ContentView: View {
    
    @State private var items = [Item(value: 1), Item(value: 2), Item(value: 3), Item(value: 4), Item(value: 5), Item(value: 6)]
    
    @State private var currentText = ""
    
    var body: some View {
        
        VStack {
            GenericTitle(text: currentText)
            GenericInputText(currentText: $currentText)
            Button("Add an element") {
                let newValue = items.count + 1
                let newItem = Item(value: newValue)
                items.append(newItem)
            }
            List {
                ForEach(items) { element in
                    Text("\(element.value)")
                }
            }
        }
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
