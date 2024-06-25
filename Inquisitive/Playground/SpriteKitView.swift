//
//  CoconutGameView.swift
//  Inquisitive
//
//  Created by Daniel Ian on 24/06/24.
//

import SwiftUI
import SpriteKit

struct SpriteKitView: UIViewRepresentable {
    var sceneName: String
    var sceneClass: SKScene

    func makeUIView(context: Context) -> SKView {
        let view = SKView()
        if let scene = SKScene(fileNamed: sceneName) {
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
        }
        view.ignoresSiblingOrder = false
        view.showsFPS = false
        view.showsNodeCount = false
        return view
    }

    func updateUIView(_ uiView: SKView, context: Context) {
        // Update the view if needed
    }
}


#Preview {
    SpriteKitView(sceneName: "CoconutGameScene", sceneClass: CoconutGameScene(size: CGSize(width: 1400, height: 1100)))
                .frame(width: 1400, height: 1100)
}
