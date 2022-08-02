//
//  NodeView.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/22.
//

import SwiftUI

struct NodeView: View {
    @ObservedObject var nodeInfo: Node
    
    
    private func nodeColor(state: NodeState) -> Color {
        var nodeColor: Color
        switch state {
        case .visited:
            nodeColor = .blue
        case .start:
            nodeColor = .green
        case .destination:
            nodeColor = .red
        case .wall:
            nodeColor = .black
        default:
            nodeColor = .white
        }
        
        return nodeColor
    }
    
    var body: some View {
        Rectangle()
            .fill(nodeColor(state: nodeInfo.getState()))
            .frame(width: 25, height: 25)

    }
}

struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(nodeInfo: Node(as: .start(false), index: (0, 0)))
    }
}
