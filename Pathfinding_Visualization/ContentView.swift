//
//  ContentView.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/18.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Model(maxRow: 30, maxColumn: 40)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 1) {
                ForEach(model.grid, id: \.self) { row in
                    HStack(spacing: 1) {
                        ForEach(row) { node in
                            NodeView(nodeInfo: node)
                        }
                    }
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
