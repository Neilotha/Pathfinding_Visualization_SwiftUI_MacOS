//
//  Model.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/18.
//

import Foundation

final class Model: ObservableObject {
//    @Published var grid: [[Node]]
    var grid: Grid
    private var lastUpdatedNode = (row: -1, column: -1)
    
    func resetActionState() {
        lastUpdatedNode = (-1, -1)
    }
    
    func wallAction(row: Int, column: Int) {
        if row != lastUpdatedNode.row || column != lastUpdatedNode.column {
            grid.grid[row][column].toggleWall()
            lastUpdatedNode = (row, column)
        }
        else {
//            print("node: [\(row), \(column)]duplicate trigger dected!")
        }
    }
    
    init(maxRow: Int, maxColumn: Int) {
        self.grid = Grid(maxRow: maxRow, maxColumn: maxColumn)
    }
//    init(maxRow: Int, maxColumn: Int) {
//        self.grid = [[Node]](
//            repeating: [Node](repeating: Node(as: .empty, index: (0, 0)), count: maxColumn),
//            count: maxRow)
//
//        for row in 0 ..< maxRow {
//            for column in 0 ..< maxColumn {
//                self.grid[row][column] = Node(as: .empty, index: (row, column))
//            }
//        }
//        self.grid[maxRow/2][maxColumn/3] = Node(as: .start(false), index: (maxRow/2, maxColumn/3))
//        self.grid[maxRow/2][(maxColumn/3) * 2] = Node(as: .destination(false), index: (maxRow/2, (maxColumn/3) * 2))
//
//    }
    
}

