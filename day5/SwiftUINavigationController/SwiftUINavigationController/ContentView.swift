//
//  ContentView.swift
//  SwiftUINavigationController
//
//  Created by Christian Quicano on 3/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var indexSelected = 0
    
    @State var displayDetailView = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                NavigationLink(destination: ContentView(), isActive: $displayDetailView) {
                    EmptyView()
                }
                List {
                    
                    NavigationLink(destination: SegmentControl(indexSelected: $indexSelected)) {
                        Text("Segment Control - current segment selected: \(indexSelected)")
                    }
                    
                    NavigationLink(destination: GameView()) {
                        Text("Color game view")
                    }
                }
                .listStyle(.plain)
                Button {
                    // get input for user
                    // set those inputs to oue viewmodel
                    // do login
                    // result
                    displayDetailView = true
                } label: {
                    Text("Login button")
                }

            }
            .navigationTitle("Examples")
            .navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
