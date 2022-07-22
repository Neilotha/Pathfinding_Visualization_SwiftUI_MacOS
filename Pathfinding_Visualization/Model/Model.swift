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
        self.grid[20][10] = Node(as: .start(false))
        self.grid[20][20] = Node(as: .destination(false))
    }
    
}

