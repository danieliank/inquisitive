import SpriteKit
import GameplayKit

class CoconutGameScene: SKScene, SKPhysicsContactDelegate, UITextFieldDelegate {
    
    // Properties
    private var height: Int = 0
    private var time: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0
    private var velocity: Float = 0
    private var distance: Float = 0
    private var distanceInput: Float = 400
    private var remainingDistance: Float = 0
    
    private var timeLabel: SKLabelNode!
    private var velocityLabel: SKLabelNode!
    private var distanceLabel: SKLabelNode!
    
    private var backgrounds: [SKSpriteNode] = []
    private var coconutTrees: [SKSpriteNode] = []
    
    private var coconut: SKSpriteNode?
    private var coconutBubble: SKSpriteNode?
    private var coconutBubbleLabel: SKLabelNode?
    
    private var startButton: SKSpriteNode?
    private var restartButton: SKSpriteNode?
    private var inputDistanceTextField: UITextField!
    private var tapGestureRecognizer: UITapGestureRecognizer!

    // Constants
    private let fontSize: CGFloat = 24
    private let fontColor: UIColor = .black
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        resetGameState()
        setupTextField(view: view) // Pass the view here
        setupLabels()
        setupNodes()
        setupCoconut()
        setupCoconutBubble()
        setupButton()
        self.isPaused = true
        
        self.isUserInteractionEnabled = true
        view.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
        
        // Move the coconut to the bottom of the screen
        guard let coconut = coconut else { return }
        let moveAction = SKAction.move(to: CGPoint(x: coconut.position.x, y: -300), duration: countTime(height: Double(height)))
        coconut.run(moveAction) {
            self.isPaused = true
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let deltaTime = calculateDeltaTime(currentTime: currentTime)
        updateGameState(deltaTime: deltaTime)
        updateLabels()
        moveAndResetBackgrounds(nodes: backgrounds, speed: CGFloat(2.0 * velocity) * CGFloat(deltaTime))
        moveAndResetNodes(nodes: coconutTrees, speed: CGFloat(2.0 * velocity) * CGFloat(deltaTime))
        velocity += Float(deltaTime * 9.8)
        updateCoconutBubblePosition()
    }
    
    // MARK: - Setup Methods
    
    private func resetGameState() {
        time = 0
        distance = 0
        lastUpdateTime = 0
        remainingDistance = distanceInput
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
        height = Int(((distanceInput - 400) / 100 + 8))
        setupBackgroundNodes()
        setupCoconutTreeNodes()
        setupCoconutStretchTree(distance: distanceInput)
        setupBeachBackground(distance: distanceInput)
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
            coconutTrees.append(newCoconutTree)
            coconutTree.removeFromParent()
        }
    }
    
    private func setupCoconutStretchTree(distance: Float){
        height = Int(((distanceInput - 400) / 100 + 8))
        if let stretchTree = self.childNode(withName: "TreeStretch") as? SKSpriteNode {
            for i in 8...height {
                let newStretchTree = createCopy(of: stretchTree, at: CGPoint(x: stretchTree.position.x, y: stretchTree.position.y - stretchTree.size.height * CGFloat(i-8)), zPosition: -20)
                coconutTrees.append(newStretchTree)
            }
        }
    }
    
    private func setupBeachBackground(distance: Float){
        height = Int(((distanceInput - 400) / 100 + 8))
        if let backgroundBeach = self.childNode(withName: "BackgroundBeach") as? SKSpriteNode {
            let newBackgroundBeach = createCopy(of: backgroundBeach, at: CGPoint(x: 0, y:-83 - 200 * CGFloat(height-7)+200), zPosition: 0)
            coconutTrees.append(newBackgroundBeach)
        }
    }
    
    private func setupButton() {
        startButton = self.childNode(withName: "StartButton") as? SKSpriteNode
        startButton?.zPosition = 30
        restartButton = self.childNode(withName: "RestartButton") as? SKSpriteNode
        restartButton?.zPosition = -30
    }
    
    private func setupTextField(view: SKView) {
        inputDistanceTextField = UITextField(frame: CGRect(x: 370, y: 880, width: 80, height: 80))
        inputDistanceTextField.borderStyle = .none
        inputDistanceTextField.backgroundColor = .clear
        inputDistanceTextField.keyboardType = .numberPad
        inputDistanceTextField.placeholder = "400"
        inputDistanceTextField.text = "\(Int(distanceInput))" // Set default value
        inputDistanceTextField.delegate = self
        inputDistanceTextField.font = UIFont.systemFont(ofSize: 26)
        view.addSubview(inputDistanceTextField)
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
        textLabel.fontSize = 24
        textLabel.fontColor = .black
        textLabel.text = String(format: "%.2f", remainingDistance)
        textLabel.position = CGPoint(x: 0, y: 0)
        coconutBubble.addChild(textLabel)
        self.coconutBubbleLabel = textLabel
    }
    
    private func updateCoconutBubblePosition() {
        guard let coconut = coconut, let coconutBubble = coconutBubble else { return }
        coconutBubble.position = CGPoint(x: coconut.position.x + coconut.size.width + 40, y: coconut.position.y)
        
        if remainingDistance <= 1 {
            coconutBubbleLabel?.text = "0"
        } else {
            coconutBubbleLabel?.text = String(format: "%.2f", remainingDistance)
        }
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
        remainingDistance = distanceInput - distance // Update remainingDistance
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
    
    private func countTime(height: Double) -> Double{
        return sqrt((400+(height-8)*100)/4.9)
    }
    
//    // MARK: - Button Toggle
//    
//    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
//        let location = sender.location(in: self.view)
//        let skLocation = convertPoint(fromView: location)
//        
//        if let startButton = startButton, startButton.contains(skLocation) {
//            toggleButtons()
//        }
//    }
//    
//    private func toggleButtons() {
//        guard let startButton = startButton, let restartButton = restartButton else { return }
//        
//        // Swap zPosition values
//        let startButtonZPosition = startButton.zPosition
//        startButton.zPosition = restartButton.zPosition
//        restartButton.zPosition = startButtonZPosition
//        
//        self.isPaused = !self.isPaused
//    }
    
    // MARK: - Touch Handling
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        if startButton?.contains(location) == true {
            if self.isPaused {
                resetGameState()
                setupNodes()
                updateLabels()
                self.isPaused = false
                startButton?.texture = SKTexture(imageNamed: "RestartButton")
            } else {
                self.isPaused = true
                startButton?.texture = SKTexture(imageNamed: "StartButton")
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
        
        // Check if the new length is within the 4-digit limit
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        if allowedCharacters.isSuperset(of: characterSet) && updatedText.count <= 5 {
            if let value = Float(updatedText), value <= 400 {
                distanceInput = value
            }
            return true
        }
        return false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, let value = Float(text) {
            if value < 400 {
                distanceInput = 400
            } else if value > 1000 {
                distanceInput = 1000
            } else {
                distanceInput = value
            }
            textField.text = "\(Int(distanceInput))"
        } else {
            // Reset to default if input is invalid
            distanceInput = 400
            textField.text = "\(Int(distanceInput))"
        }
    }
}
