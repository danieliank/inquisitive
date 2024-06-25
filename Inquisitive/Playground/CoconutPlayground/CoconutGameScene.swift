import SpriteKit
import GameplayKit

class CoconutGameScene: SKScene, SKPhysicsContactDelegate {
    
    // Properties
    private var height: Int = 50
//    private var dura: Double = 13.7
    private var time: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0
    private var velocity: Float = 0
    private var previousVelocity: Float = 1
    private var distance: Float = 0
    
    private var timeLabel: SKLabelNode!
    private var velocityLabel: SKLabelNode!
    private var distanceLabel: SKLabelNode!
    
    private var backgrounds: [SKSpriteNode] = []
    private var coconutTrees: [SKSpriteNode] = []
    
    private var coconut: SKSpriteNode?
    private var coconutBubble: SKSpriteNode?
    private var coconutBubbleLabel: SKLabelNode? // Reference to the label inside the bubble
    
    // Constants
    private let fontSize: CGFloat = 24
    private let fontColor: UIColor = .black
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        resetGameState()
        setupLabels()
        setupNodes()
        setupCoconut()
        setupCoconutBubble()
        self.isPaused = false
        
        // Move the coconut to the bottom of the screen
        guard let coconut = coconut else { return }
        let moveAction = SKAction.move(to: CGPoint(x: coconut.position.x, y: -300), duration: countTime(height: Double(height)))
        coconut.run(moveAction) {
            self.animateCoconut()
            self.isPaused = true
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = calculateDeltaTime(currentTime: currentTime)
        updateGameState(deltaTime: deltaTime)
        updateLabels()
        moveAndResetBackgrounds(nodes: backgrounds, speed: CGFloat(2.0 * velocity) * CGFloat(deltaTime))
        moveAndResetNodes(nodes: coconutTrees, speed: CGFloat(2.0 * velocity) * CGFloat(deltaTime))
        updateCoconutAnimationSpeedIfNeeded()
        velocity += Float(deltaTime * 9.8)
        updateCoconutBubblePosition()
    }
    
    // MARK: - Setup Methods
    
    private func resetGameState() {
        time = 0
        distance = 0
        lastUpdateTime = 0
    }
    
    private func setupLabels() {
        timeLabel = createLabel(text: "Time: 0.00", position: CGPoint(x: self.frame.midX - 100, y: self.frame.midY + 200))
        velocityLabel = createLabel(text: "Velocity: 0.00", position: CGPoint(x: self.frame.midX - 100, y: self.frame.midY + 160))
        distanceLabel = createLabel(text: "Distance: 0.00", position: CGPoint(x: self.frame.midX - 100, y: self.frame.midY + 120))
    }
    
    private func createLabel(text: String, position: CGPoint) -> SKLabelNode {
        let label = SKLabelNode(fontNamed: "Arial")
        label.fontSize = fontSize
        label.fontColor = fontColor
        label.position = position
        label.zPosition = 100
        label.text = text
        addChild(label)
        return label
    }
    
    private func setupNodes() {
        setupBackgroundNodes()
        setupCoconutTreeNodes()
    }
    
    private func setupBackgroundNodes() {
        if let background = self.childNode(withName: "BackgroundSky") as? SKSpriteNode {
            let newBackground = createCopy(of: background, at: CGPoint(x: background.position.x, y: background.position.y), zPosition: -30)
            backgrounds.append(newBackground)
            background.removeFromParent()
            
            for i in 0...100 {
                let newBackground = createCopy(of: background, at: CGPoint(x: background.position.x, y: background.position.y * CGFloat(i)), zPosition: -30)
                backgrounds.append(newBackground)
                background.removeFromParent()
            }
        }
    }
    
    private func setupCoconutTreeNodes() {
        if let coconutTree = self.childNode(withName: "CoconutTree") as? SKSpriteNode {
            let newCoconutTree = createCopy(of: coconutTree, at: CGPoint(x: coconutTree.position.x, y: coconutTree.position.y), zPosition: -20)
            
            if let stretchTree = self.childNode(withName: "TreeStretch") as? SKSpriteNode {
                if let backgroundBeach = self.childNode(withName: "BackgroundBeach") as? SKSpriteNode {
                    
                    coconutTrees.append(newCoconutTree)
                    
                    for i in 8...height {
                        let newStretchTree = createCopy(of: stretchTree, at: CGPoint(x: stretchTree.position.x, y: stretchTree.position.y - stretchTree.size.height * CGFloat(i-8)), zPosition: -20)
//                        print(stretchTree.position.y - stretchTree.size.height * CGFloat(i-8))
                        coconutTrees.append(newStretchTree)
                    }
                    let newBackgroundBeach = createCopy(of: backgroundBeach, at: CGPoint(x: 0, y: coconutTree.position.y - stretchTree.size.height * CGFloat(height-7)+200), zPosition: 0)
                    newBackgroundBeach.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: newBackgroundBeach.size.width / 100 - 100, height: newBackgroundBeach.size.height))
                    newBackgroundBeach.physicsBody?.isDynamic = false
                    coconutTrees.append(newBackgroundBeach)
//                    let collisionLine = SKSpriteNode(color: .red, size: CGSize(width: newBackgroundBeach.size.width, height: 1))
//                    let newCollisionLine = createCopy(of: collisionLine, at: CGPoint(x: 0, y: (stretchTree.position.y - stretchTree.size.height * CGFloat(height-7))-200), zPosition: 10)
//                    newCollisionLine.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: newCollisionLine.size.width, height: newCollisionLine.size.height * 150))
//                    newCollisionLine.physicsBody?.isDynamic = false
//                    newCollisionLine.physicsBody?.categoryBitMask = 2
//                    newCollisionLine.physicsBody?.contactTestBitMask = 1
//                    newCollisionLine.physicsBody?.collisionBitMask = 1
//                    coconutTrees.append(newCollisionLine)
                    
                    coconutTree.removeFromParent()
                }
            }
        }
    }
    
    private func createCopy(of node: SKSpriteNode, at position: CGPoint, zPosition: CGFloat) -> SKSpriteNode {
        let newNode = node.copy() as! SKSpriteNode
        newNode.position = position
        newNode.zPosition = zPosition
        addChild(newNode)
        return newNode
    }
    
    private func setupCoconut() {
        coconut = self.childNode(withName: "Coconut") as? SKSpriteNode
        coconut?.zPosition = 10
//        coconut?.physicsBody = SKPhysicsBody(circleOfRadius: coconut!.size.width)
//        coconut?.physicsBody?.affectedByGravity = false
//        coconut?.physicsBody?.categoryBitMask = 1
//        coconut?.physicsBody?.contactTestBitMask = 2
//        coconut?.physicsBody?.collisionBitMask = 2
    }
    
    private func setupCoconutBubble() {
        guard let coconut = coconut else { return }
        
        // Create the coconut bubble sprite node
        let coconutBubble = SKSpriteNode(imageNamed: "CoconutBubble")
        coconutBubble.position = CGPoint(x: coconut.position.x + coconut.size.width + 40, y: coconut.position.y)
        coconutBubble.zPosition = 50
        addChild(coconutBubble)
        self.coconutBubble = coconutBubble
        
        // Create and configure the label node
        let textLabel = SKLabelNode(fontNamed: "Arial")
        textLabel.fontSize = 16
        textLabel.fontColor = .black
        textLabel.text = String(format: "%.2f", distance)
        textLabel.position = CGPoint(x: 0, y: 0)
        coconutBubble.addChild(textLabel)
        self.coconutBubbleLabel = textLabel
    }
    
    private func updateCoconutBubblePosition() {
        guard let coconut = coconut, let coconutBubble = coconutBubble else { return }
        coconutBubble.position = CGPoint(x: coconut.position.x + coconut.size.width + 40, y: coconut.position.y)
        
        // Update the text inside the coconut bubble
        coconutBubbleLabel?.text = String(format: "%.2f", distance)
    }
    
    // MARK: - Game State Methods
    
    private func calculateDeltaTime(currentTime: TimeInterval) -> TimeInterval {
        let deltaTime: TimeInterval
        if lastUpdateTime == 0 {
            deltaTime = 0
        } else {
            deltaTime = currentTime - lastUpdateTime
        }
        lastUpdateTime = currentTime
        return deltaTime
    }
    
    private func updateGameState(deltaTime: TimeInterval) {
        time += deltaTime
        distance += Float(deltaTime) * velocity
    }
    
    private func updateLabels() {
        timeLabel.text = String(format: "Time: %.2f", time)
        velocityLabel.text = String(format: "Velocity: %.2f", velocity)
        distanceLabel.text = String(format: "Distance: %.2f", distance)
    }
    
    private func moveAndResetNodes(nodes: [SKSpriteNode], speed: CGFloat) {
        for node in nodes {
            node.position.y += speed
        }
    }
    
    private func moveAndResetBackgrounds(nodes: [SKSpriteNode], speed: CGFloat) {
        for node in nodes {
            node.position.y += speed
        }
    }
    
    // MARK: - Animation Methods
    
    private func animateCoconut() {
        guard let coconut = coconut else { return }
        let rotateAction = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: 5.0) // Slower rotation
        let repeatAction = SKAction.repeatForever(rotateAction)
        coconut.run(repeatAction, withKey: "coconutRotation")
    }
    
    private func updateCoconutAnimationSpeedIfNeeded() {
        if velocity != previousVelocity {
            previousVelocity = velocity
            adjustCoconutAnimationSpeed()
        }
    }
    private func countTime(height: Double) -> Double{
        return sqrt((400+(height-8)*100)/4.9)
    }
    
    private func adjustCoconutAnimationSpeed() {
        guard let coconut = coconut, coconut.action(forKey: "coconutRotation") != nil else {
            return
        }
        coconut.removeAction(forKey: "coconutRotation")
        
        let newDuration = 5000.0 / Double(velocity) // Adjust the duration based on velocity
        let rotateAction = SKAction.rotate(byAngle: CGFloat.pi * 2, duration: newDuration)
        let repeatAction = SKAction.repeatForever(rotateAction)
        coconut.run(repeatAction, withKey: "coconutRotation")
    }
    
    // MARK: - Contact Delegate Method
    
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == 1 && contact.bodyB.categoryBitMask == 2) ||
            (contact.bodyA.categoryBitMask == 2 && contact.bodyB.categoryBitMask == 1) {
            self.isPaused = true
        }
    }
}
