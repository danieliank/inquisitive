import SpriteKit
import GameplayKit

class PlaygroundConstantVelocity: SKScene, UITextFieldDelegate {
    
    // Properties
    private var time: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0
    private var velocity: Float = 10
    private var previousVelocity: Float = 1
    private var distance: Float = 0
    
    private var timeLabel: SKLabelNode!
    private var distanceLabel: SKLabelNode!
    
    private var backgrounds: [SKSpriteNode] = []
    private var rails: [SKSpriteNode] = []
    private var grounds: [SKSpriteNode] = []
    
    private var train: SKSpriteNode?
    private var playButton: SKSpriteNode?
    
    private var velocityTextField: UITextField!
    private var tapGestureRecognizer: UITapGestureRecognizer!
    
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
        setupButtons()
        setupTextField(view: view) // Pass the view here
        self.isPaused = true
        animateTrain()
        
        // Enable user interaction for the scene
        self.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = calculateDeltaTime(currentTime: currentTime)
        updateGameState(deltaTime: deltaTime)
        updateLabels()
        moveAndResetNodes(nodes: backgrounds, speed: CGFloat(1.87500 * velocity) * CGFloat(deltaTime))
        moveAndResetNodes(nodes: rails, speed: CGFloat(90 * velocity) * CGFloat(deltaTime))
        moveAndResetNodes(nodes: grounds, speed: CGFloat(87.5 * velocity) * CGFloat(deltaTime))
        updateTrainAnimationSpeedIfNeeded()
    }
    
    // MARK: - Setup Methods
    
    private func resetGameState() {
        time = 0
        distance = 0
        lastUpdateTime = 0
    }
    
    private func setupLabels() {
        timeLabel = createLabel(text: "Time: 0.00", position: CGPoint(x: 554, y: 417))
        distanceLabel = createLabel(text: "Distance: 0.00", position: CGPoint(x: 554, y: 377))
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
    
    private func setupButtons() {
        playButton = self.childNode(withName: "PlayButton") as? SKSpriteNode
        playButton?.texture = SKTexture(imageNamed: "User Interface/playPlayground")
    }
    
    private func setupTextField(view: SKView) {
        velocityTextField = UITextField(frame: CGRect(x: 675, y: 855, width: 50, height: 80))
        velocityTextField.borderStyle = .none
        velocityTextField.backgroundColor = .clear
        velocityTextField.keyboardType = .numberPad
        velocityTextField.placeholder = "0"
        velocityTextField.text = "\(Int(velocity))" // Set default value
        velocityTextField.delegate = self
        velocityTextField.font = UIFont.systemFont(ofSize: 26)
        view.addSubview(velocityTextField)
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
        timeLabel.text = String(format: "Time: %.2f s", time)
        distanceLabel.text = String(format: "Distance: %.2f m", distance)
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
        let animation = SKAction.animate(with: textures, timePerFrame: 0.0227)
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
        train?.speed = CGFloat(velocity)
    }
    
    // MARK: - Touch Handling
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        if playButton?.contains(location) == true {
            if self.isPaused {
                self.isPaused = false
                playButton?.texture = SKTexture(imageNamed: "User Interface/stopPlayground")
            } else {
                self.isPaused = true
                playButton?.texture = SKTexture(imageNamed: "User Interface/playPlayground")
                resetGameState()
                updateLabels()
            }
        }
    }
    
    @objc private func handleTap() {
        self.view?.endEditing(true)
    }
    
    // MARK: - UITextFieldDelegate Methods

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Allow only numbers
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        // Check if the new length is within the 2-digit limit
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if allowedCharacters.isSuperset(of: characterSet) && updatedText.count <= 2 {
            if let value = Float(updatedText), value <= 20 {
                velocity = value
            }
            return true
        }
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let value = Float(text) {
            if value < 0 {
                velocity = 0
            } else if value > 20 {
                velocity = 20
            } else {
                velocity = value
            }
            textField.text = "\(Int(velocity))"
        } else {
            // Reset to default if input is invalid
            velocity = 10
            textField.text = "\(Int(velocity))"
        }
    }
}
