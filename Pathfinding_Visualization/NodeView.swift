//
//  NodeView.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/22.
//

import SwiftUI

struct NodeView: View {
    var nodeInfo: Node
    
    private func nodeColor(state: NodeState) -> Color {
        var nodeColor: Color
        switch state {
        case .empty:
            nodeColor = .gray
        default:
            nodeColor = .green
        }
        
        return nodeColor
    }
    
    var body: some View {
        Rectangle()
            .fill(nodeColor(state: nodeInfo.getState()))
            .scaledToFit()
    }
}

struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(nodeInfo: Node(as: .start(false)))
    }
}
