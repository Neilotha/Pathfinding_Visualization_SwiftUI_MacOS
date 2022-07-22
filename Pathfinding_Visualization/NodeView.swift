//
//  NodeView.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/22.
//

import SwiftUI

struct NodeView: View {
    var nodeInfo: Node
    var body: some View {
        Rectangle()
            .fill(.green)
            .scaledToFit()
    }
}

struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(nodeInfo: Node(as: .empty))
    }
}
