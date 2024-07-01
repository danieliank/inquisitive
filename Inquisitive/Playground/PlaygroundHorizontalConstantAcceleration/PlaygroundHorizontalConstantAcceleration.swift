import SpriteKit
import GameplayKit

class PlaygroundHorizontalConstantAcceleration: SKScene, UITextFieldDelegate {
    
    // Properties
    private var time: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0
    private var velocity: Float = 10
    private var previousVelocity: Float = 1
    private var distance: Float = 0
    private var acceleration: Float = 1
    
    private var timeLabel: SKLabelNode!
    private var distanceLabel: SKLabelNode!
    
    private var backgrounds: [SKSpriteNode] = []
    private var rails: [SKSpriteNode] = []
    private var grounds: [SKSpriteNode] = []
    
    private var train: SKSpriteNode?
    private var playButton: SKSpriteNode?
    
    private var velocityTextField: UITextField!
    private var accelerationTextField: UITextField!
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
        setupTextFields(view: view)
        self.isPaused = true
        animateTrain()
        
        self.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = calculateDeltaTime(currentTime: currentTime)
        updateGameState(deltaTime: deltaTime)
        updateLabels()
        moveAndResetNodes(nodes: backgrounds, speed: CGFloat(1.87500 * velocity) * CGFloat(deltaTime))
        moveAndResetNodes(nodes: rails, speed: CGFloat(30 * velocity) * CGFloat(deltaTime))
        moveAndResetNodes(nodes: grounds, speed: CGFloat(37.5 * velocity) * CGFloat(deltaTime))
        updateTrainAnimationSpeed()
    }
    
    // MARK: - Setup Methods
    
    private func resetGameState() {
        time = 0
        distance = 0
        lastUpdateTime = 0
        velocity = 10
        acceleration = 1
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
                let newRail = createCopy(of: rail, at: CGPoint(x: rail.size.width * CGFloat(i) - rail.size.width / 2, y: rail.position.y), zPosition: -20)
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
    
    private func setupTextFields(view: SKView) {
        velocityTextField = UITextField(frame: CGRect(x: 570, y: 870, width: 50, height: 40))
        velocityTextField.borderStyle = .none
        velocityTextField.backgroundColor = .clear
        velocityTextField.keyboardType = .numberPad
        velocityTextField.placeholder = "0"
        velocityTextField.text = "\(Int(velocity))"
        velocityTextField.delegate = self
        velocityTextField.font = UIFont.systemFont(ofSize: 26)
        view.addSubview(velocityTextField)
        
        accelerationTextField = UITextField(frame: CGRect(x: 785, y: 870, width: 50, height: 40))
        accelerationTextField.borderStyle = .none
        accelerationTextField.backgroundColor = .clear
        accelerationTextField.keyboardType = .numberPad
        accelerationTextField.placeholder = "1"
        accelerationTextField.text = "\(Int(acceleration))"
        accelerationTextField.delegate = self
        accelerationTextField.font = UIFont.systemFont(ofSize: 26)
        view.addSubview(accelerationTextField)
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
        velocity += acceleration * Float(deltaTime)
        if velocity > 30 {
            velocity = 30
        }
    }
    
    private func updateLabels() {
        timeLabel.text = String(format: "Time: %.2f s", time)
        distanceLabel.text = String(format: "Distance: %.2f m", distance)
        velocityTextField.text = "\(Int(velocity))"
        accelerationTextField.text = "\(Int(acceleration))"
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
        for i in 0...35 {
            let textureName = String(format: "Scene_Horizontal Constant Acceleration/Car/Comp 1_%05d", i)
            textures.append(SKTexture(imageNamed: textureName))
        }
        let animation = SKAction.animate(with: textures, timePerFrame: 0.0227)
        let repeatAnimation = SKAction.repeatForever(animation)
        train?.run(repeatAnimation, withKey: "trainAnimation")
    }

    private func updateTrainAnimationSpeed() {
        guard let train = train else { return }
        let minSpeed: Float = 1.0
        let maxSpeed: Float = 3.0
        let animationSpeed = minSpeed + (maxSpeed - minSpeed) * (velocity / 30.0)
        train.speed = CGFloat(animationSpeed)
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
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if allowedCharacters.isSuperset(of: characterSet) && updatedText.count <= 2 {
            if textField == velocityTextField {
                if let value = Float(updatedText), value <= 30 {
                    velocity = value
                }
            } else if textField == accelerationTextField {
                if let value = Float(updatedText) {
                    acceleration = value
                }
            }
            return true
        }
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == velocityTextField {
            if let text = textField.text, let value = Float(text) {
                if value < 0 {
                    velocity = 0
                } else if value > 30 {
                    velocity = 30
                } else {
                    velocity = value
                }
                textField.text = "\(Int(velocity))"
            } else {
                velocity = 10
                textField.text = "\(Int(velocity))"
            }
        } else if textField == accelerationTextField {
            if let text = textField.text, let value = Float(text) {
                if value < 0 {
                    acceleration = 0
                } else {
                    acceleration = value
                }
                textField.text = "\(Int(acceleration))"
            } else {
                acceleration = 1
                textField.text = "\(Int(acceleration))"
            }
        }
    }
}
