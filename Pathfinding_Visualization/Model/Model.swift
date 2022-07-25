//
//  Model.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/18.
//

import Foundation

final class Model: ObservableObject {
    @Published var grid: [[Node]]
    
    init() {
        self.grid = [[Node]](
            repeating: [Node](repeating: Node(as: .empty), count: 30),
            count: 30)
        self.grid[16][10] = Node(as: .start(false))
        self.grid[16][20] = Node(as: .destination(false))
    }
    
}

