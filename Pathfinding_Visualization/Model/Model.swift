//
//  Model.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/18.
//

import Foundation

final class Model: ObservableObject {
    @Published var grid: [[Node]]
    
    
    init(maxRow: Int, maxColumn: Int) {
        self.grid = [[Node]](
            repeating: [Node](repeating: Node(as: .empty), count: maxColumn),
            count: maxRow)
        
        for row in 0 ..< maxRow {
            for column in 0 ..< maxColumn {
                self.grid[row][column] = Node(as: .empty)
            }
        }
        self.grid[maxRow/2][maxColumn/3] = Node(as: .start(false))
        self.grid[maxRow/2][(maxColumn/3) * 2] = Node(as: .destination(false))
    }
    
}

