import SwiftUI
import SpriteKit

struct SpriteKitView: UIViewRepresentable {
    var sceneName: String
    var sceneClass: SKScene.Type
    
    func makeUIView(context: Context) -> SKView {
        let view = SKView()
        if let scene = sceneClass.init(fileNamed: sceneName) {
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

struct PlaygroundView: View {
    @Binding var isPresented: Bool
    var sceneName: String
    var sceneClass: SKScene.Type
    
    var body: some View {
        ZStack {
            SpriteKitView(sceneName: sceneName, sceneClass: sceneClass.self)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        isPresented = false
                    }) {
                        Image("User Interface/exit")
                            .scaleEffect(0.5)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .position(x: 50, y: 30)
                    Spacer()
                }
                Spacer()
            }
        }
//        .navigationBarBackButtonHidden()
    }
}

#Preview {
    PlaygroundView(isPresented: .constant(true), sceneName: "PlaygroundHorizontalConstantAcceleration", sceneClass: PlaygroundHorizontalConstantAcceleration.self)
}

