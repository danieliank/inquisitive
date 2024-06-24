import SpriteKit
import GameplayKit

class PlaygroundConstantVelocity: SKScene {
    
    // Properties
    private var time: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0
    private var velocity: Float = 20
    private var previousVelocity: Float = 1
    private var distance: Float = 0
    
    private var timeLabel: SKLabelNode!
    private var velocityLabel: SKLabelNode!
    private var distanceLabel: SKLabelNode!
    
    private var backgrounds: [SKSpriteNode] = []
    private var rails: [SKSpriteNode] = []
    private var grounds: [SKSpriteNode] = []
    
    private var train: SKSpriteNode?
    
    // Constants
    private let fontSize: CGFloat = 24
    private let fontColor: UIColor = .black
    private let wheelCircumference: Float = 79.1
    private let railLength: Float = 1366
    
    override func didMove(to view: SKView) {
        resetGameState()
        setupLabels()
        setupNodes()
        setupTrain()
        self.isPaused = false
        animateTrain()
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = calculateDeltaTime(currentTime: currentTime)
        updateGameState(deltaTime: deltaTime)
        updateLabels()
        moveAndResetNodes(nodes: backgrounds, speed: CGFloat(1.87500 * velocity) * CGFloat(deltaTime))
        moveAndResetNodes(nodes: rails, speed: CGFloat(30 * velocity) * CGFloat(deltaTime))
        moveAndResetNodes(nodes: grounds, speed: CGFloat(37.5 * velocity) * CGFloat(deltaTime))
        updateTrainAnimationSpeedIfNeeded()
    }
    
    // MARK: - Setup Methods
    
    private func resetGameState() {
        time = 0
        distance = 0
        lastUpdateTime = 0
    }
    
    private func setupLabels() {
        timeLabel = createLabel(text: "Time: 0.00", position: CGPoint(x: self.frame.midX - 100, y: self.frame.midY + 200))
        velocityLabel = createLabel(text: "Velocity: 30.00", position: CGPoint(x: self.frame.midX - 100, y: self.frame.midY + 160))
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
        setupRailNodes()
        setupGroundNodes()
    }
    
    private func setupBackgroundNodes() {
        if let background = self.childNode(withName: "Background") as? SKSpriteNode {
            for i in 0..<3 {
                let newBackground = createCopy(of: background, at: CGPoint(x: background.size.width * CGFloat(i) - 15, y: background.position.y), zPosition: -30)
                backgrounds.append(newBackground)
            }
            background.removeFromParent()
        }
    }
    
    private func setupRailNodes() {
        if let rail = self.childNode(withName: "Rail") as? SKSpriteNode {
            for i in 0..<3 {
                let newRail = createCopy(of: rail, at: CGPoint(x: rail.size.width * CGFloat(i) - 15, y: rail.position.y), zPosition: -20)
                rails.append(newRail)
            }
            rail.removeFromParent()
        }
    }
    
    private func setupGroundNodes() {
        if let ground = self.childNode(withName: "Ground") as? SKSpriteNode {
            for i in 0..<3 {
                let newGround = createCopy(of: ground, at: CGPoint(x: ground.size.width * CGFloat(i) - 15, y: ground.position.y), zPosition: -10)
                grounds.append(newGround)
            }
            ground.removeFromParent()
        }
    }
    
    private func createCopy(of node: SKSpriteNode, at position: CGPoint, zPosition: CGFloat) -> SKSpriteNode {
        let newNode = node.copy() as! SKSpriteNode
        newNode.position = position
        newNode.zPosition = zPosition
        addChild(newNode)
        return newNode
    }
    
    private func setupTrain() {
        train = self.childNode(withName: "Train") as? SKSpriteNode
        train?.zPosition = 0
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
            node.position.x -= speed
            if node.position.x < -node.size.width {
                node.position.x += node.size.width * CGFloat(nodes.count)
            }
        }
    }
    
    // MARK: - Animation Methods
    
    private func animateTrain() {
        var textures: [SKTexture] = []
        for i in 0..<45 {
            let textureName = String(format: "Scene_Constant Velocity/Train/KERETA_%05d", i)
            textures.append(SKTexture(imageNamed: textureName))
        }
        let animation = SKAction.animate(with: textures, timePerFrame: 0.1)
        let repeatAnimation = SKAction.repeatForever(animation)
        train?.run(repeatAnimation, withKey: "trainAnimation")
    }
    
    private func updateTrainAnimationSpeedIfNeeded() {
        if velocity != previousVelocity {
            previousVelocity = velocity
            adjustTrainAnimationSpeed()
        }
    }
    
    private func adjustTrainAnimationSpeed() {
        guard let train = train, train.action(forKey: "trainAnimation") != nil else {
            return
        }
        train.removeAction(forKey: "trainAnimation")
        
        var textures: [SKTexture] = []
        for i in 0..<45 {
            let textureName = String(format: "Scene_Constant Velocity/Train/KERETA_%05d", i)
            textures.append(SKTexture(imageNamed: textureName))
        }
        
        let newTimePerFrame = 0.1 / velocity
        let animation = SKAction.animate(with: textures, timePerFrame: Double(newTimePerFrame))
        let repeatAnimation = SKAction.repeatForever(animation)
        train.run(repeatAnimation, withKey: "trainAnimation")
    }
}
