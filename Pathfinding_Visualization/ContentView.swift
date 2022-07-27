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
                    node.toggleWall()
                }
            }
            
            return AnyView(Rectangle().fill(Color.clear))
            
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 1) {
                ForEach(0 ..< model.grid.count, id: \.self) { rowIndex in
                    HStack(spacing: 1) {
                        ForEach(0 ..< model.grid[0].count) { columnIndex in
                            NodeView(nodeInfo: model.grid[rowIndex][columnIndex])
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
