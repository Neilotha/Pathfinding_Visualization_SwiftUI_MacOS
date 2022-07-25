//
//  ContentView.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/18.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Model()
    
    let columns = [
        GridItem()
    ]
    var body: some View {
        NavigationView {
            VStack {
                ForEach(model.grid, id: \.self) { row in
                    HStack {
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
