//
//  Grid.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/8/2.
//

import Foundation


class Grid {
    var grid: [[Node]]
    
    init(maxRow: Int, maxColumn: Int) {
        self.grid = [[Node]](
            repeating: [Node](repeating: Node(as: .empty, index: (0, 0)), count: maxColumn),
            count: maxRow)
        
        for row in 0 ..< maxRow {
            for column in 0 ..< maxColumn {
                self.grid[row][column] = Node(as: .empty, index: (row, column))
            }
        }
        self.grid[maxRow/2][maxColumn/3] = Node(as: .start(false), index: (maxRow/2, maxColumn/3))
        self.grid[maxRow/2][(maxColumn/3) * 2] = Node(as: .destination(false), index: (maxRow/2, (maxColumn/3) * 2))
        
    }
}
