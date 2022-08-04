//
//  Node.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/22.
//

import Foundation

enum NodeState: Equatable {
    case empty
    case start(Bool)
    case destination(Bool)
    case wall
    case visited
}


class Node: Identifiable, ObservableObject {
    @Published var nodeState: NodeState
    let id = UUID()
    private var row: Int
    private var column: Int
    
    init(as state: NodeState, index: (Int, Int)) {
        self.nodeState = state
        (self.row, self.column) = index
    }
    
    func getIndex() -> (row: Int, column: Int) {
        return(self.row, self.column)
    }
    
    func getState() -> NodeState {
        return nodeState
    }
    
    func toggleWall() {
        switch self.nodeState {
        case .empty:
            self.nodeState = .wall
        case .wall:
            self.nodeState = .empty
        default:
            break
        }
        
//        print("node: [\(row), \(column)] triggered")
    }
    
    func toggleStart() {
        
        switch self.nodeState {
        // Toggling start node to none-start nodes (empty node or wall node)
        case .start(let wasWall):
            if wasWall { self.nodeState = .wall }
            else { self.nodeState = .empty }
        // Toggling none start nodes to start nodes
        case .wall:
            self.nodeState = .start(true)
        default:
            self.nodeState = .start(false)
        }
    }
    
    func toggleDestination() {
        switch self.nodeState {
        // Toggling destination node to none-destination nodes (empty node or wall node)
        case .destination(let wasWall):
            if wasWall { self.nodeState = .wall }
            else { self.nodeState = .empty }
        // Toggling none destination nodes to destination nodes
        case .wall:
            self.nodeState = .destination(true)
        default:
            self.nodeState = .destination(false)
        }
    }
    
    func visite() {
        if self.nodeState == .empty {
            self.nodeState = .visited
        }
    }
    
    
}
