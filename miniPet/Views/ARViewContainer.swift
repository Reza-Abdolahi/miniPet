//
//  ARViewContainer.swift
//  miniPet
//
//  Created by Reza Abdolahi on 30/03/2024.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: UIScreen.main.bounds)
        
        // MARK: Load 3D model
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "3d-lowPoly-Cat", ofType: "obj")!)
        
        if let modelEntity = try? Entity.load(contentsOf: url) {
            
            modelEntity.scale = SIMD3<Float>(repeating: 0.02)
            
            let anchorEntity = AnchorEntity(world: [0, 0, 0])
            anchorEntity.addChild(modelEntity)
            arView.scene.anchors.append(anchorEntity)
            
            if let hasAnchoring = modelEntity as? HasAnchoring {
                arView.scene.anchors.append(hasAnchoring)
            }
        } else {
            print("Failed to load the 3D model.")
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
}
