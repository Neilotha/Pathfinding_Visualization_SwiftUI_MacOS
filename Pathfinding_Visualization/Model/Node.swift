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

struct Node {
    private var nodeState: NodeState
    
    init(as state: NodeState) {
        self.nodeState = state
    }
    
    func getState() -> NodeState {
        return nodeState
    }
    
    mutating func toggleWall() {
        switch self.nodeState {
        case .empty:
            self.nodeState = .wall
        case .wall:
            self.nodeState = .empty
        default:
            break
        }
    }
    
    mutating func toggleStart() {
        
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
    
    mutating func toggleDestination() {
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
    
    mutating func visite() {
        if self.nodeState == .empty {
            self.nodeState = .visited
        }
    }
    
    
}
