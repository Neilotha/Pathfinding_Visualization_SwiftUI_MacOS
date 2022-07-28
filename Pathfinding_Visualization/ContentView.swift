//
//  ContentView.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/18.
//

import SwiftUI

struct ContentView: View {
    @StateObject var model = Model(maxRow: 30, maxColumn: 40)
    @GestureState private var location: CGPoint = .zero
    
    func rectReader(node: Node) -> some View {
        return GeometryReader { (geometry) -> AnyView in
            if geometry.frame(in: .global).contains(self.location) {
                DispatchQueue.main.async {
                    let index = node.getIndex()
                    print("node: [\(index.row), \(index.column)] triggered")
                    self.model.grid[index.row][index.column].toggleWall()
                }
            }
            
            return AnyView(Rectangle().fill(Color.clear))
            
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 1) {
                ForEach(model.grid, id: \.self) { row in
                    HStack(spacing: 1) {
                        ForEach(row) { node in
                            NodeView(nodeInfo: node)
                                .background(self.rectReader(node: node))
                        }
                    }
                }
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .updating($location) { (value, state, transaction) in
                    state = value.location
                    print(state)
                    print(location)
                }.onEnded { _ in
                    
                    
                })
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
