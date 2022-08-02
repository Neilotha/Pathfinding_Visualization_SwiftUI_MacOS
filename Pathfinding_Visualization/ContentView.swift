//
//  ContentView.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/18.
//

import SwiftUI
let maxRow = 40
let maxColumn = 40


struct ContentView: View {
    @StateObject var model = Model(maxRow: maxRow, maxColumn: maxColumn)
    @GestureState private var location: CGPoint = CGPoint(x: -1, y: -1)
    
    
    func rectReader(index: (row: Int, column: Int)) -> some View {
        return GeometryReader { (geometry) -> AnyView in
            if geometry.frame(in: .global).contains(self.location) {
//                DispatchQueue.main.async {
                    self.model.wallAction(row: index.row, column: index.column)
//                }
            }
            
            return AnyView(Rectangle().fill(Color.clear))
            
        }
    }
    
    var body: some View {
        let _ = Self._printChanges()
            VStack(spacing: 1) {
                ForEach(0 ..< maxRow) { row in
                    HStack(spacing: 1) {
                        ForEach(0 ..< maxColumn) { column in
                            NodeView(nodeInfo: model.grid.grid[row][column])
                                .background(self.rectReader(index: model.grid.grid[row][column].getIndex()))
                        }
                    }
                }
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                .updating($location) { (value, state, transaction) in
                    state = value.location
                }.onEnded { _ in
                    self.model.resetActionState()
                    
                })
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
