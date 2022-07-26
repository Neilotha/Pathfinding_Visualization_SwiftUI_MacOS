//
//  NodeView.swift
//  Pathfinding_Visualization
//
//  Created by Joshua Yang on 2022/7/22.
//

import SwiftUI

struct NodeView: View {
    @State var nodeInfo: Node
    @Binding var mouseDown: Bool
    
    
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
            .onHover { hover in
                if mouseDown && hover {
                    print("mouse hover")
                    nodeInfo.toggleWall()
                }
                if hover {
                    print("node: \(nodeInfo.id) hovered!")
                }
            }
            .pressAction {
                if mouseDown == false {
                    mouseDown = true
                    print("mouse down")
                    nodeInfo.toggleWall()
                }
            } onRelease: {
                mouseDown = false
                print("mouse up")
            }
        
                

    
    }
}

struct NodeView_Previews: PreviewProvider {
    static var previews: some View {
        NodeView(nodeInfo: Node(as: .start(false)), mouseDown: .constant(false))
    }
}
