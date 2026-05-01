//
//  Pong.swift
//  HallOfGames
//
//  Created by Nikolay K. Danchev on 4/17/26.
//

import SwiftUI
import SpriteKit

class GameScene: SKScene, @MainActor SKPhysicsContactDelegate {
    var ball = SKSpriteNode()
    var player = SKSpriteNode()
    var computer = SKSpriteNode()
    let label = SKLabelNode(text: "Pong")
    
    
    override func sceneDidLoad() {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        label.position = CGPoint(x: size.width / 2, y: size.height / 2)
        label.fontSize = 60
        addChild(label)
    }
    
    override func didMove(to view: SKView) {
        ball = SKSpriteNode(imageNamed: "Baseball")
        ball.size = CGSize(width: 30, height: 30)
        ball.position = CGPoint(x: size.width / 2, y: size.height / 2)
        player = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 30))
        player.position = CGPoint(x: size.width / 2, y: 40)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.isDynamic = false
        player.physicsBody?.categoryBitMask = 1
        
        computer = SKSpriteNode(color: .blue, size: CGSize(width: 100, height: 30))
        computer.position = CGPoint(x: size.width / 2, y: size.height - 40)
        computer.physicsBody = SKPhysicsBody(rectangleOf: computer.size)
        computer.physicsBody?.isDynamic = false
        computer.physicsBody?.categoryBitMask = 1
        
        addChild(ball)
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.friction = 0
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.angularDamping = 0
        ball.physicsBody?.linearDamping = 0
        ball.physicsBody?.collisionBitMask = 1
        addChild(player)
        addChild(computer)
        
        
        let bottomLeft = CGPoint(x: frame.minX, y: frame.minY)
        let bottomRight = CGPoint(x: frame.maxX, y: frame.minY)
        let playerGoal = SKNode()
        playerGoal.physicsBody = SKPhysicsBody(edgeFrom: bottomLeft, to: bottomRight)
        playerGoal.physicsBody?.node?.name = "Bottom"
        playerGoal.physicsBody?.contactTestBitMask = 1
        playerGoal.physicsBody?.collisionBitMask = 1
        addChild(playerGoal)
        
        let topLeft = CGPoint(x: frame.minX, y: frame.maxY)
        let topRight = CGPoint(x: frame.maxX, y: frame.maxY)
        let computerGoal = SKNode()
        computerGoal.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        computerGoal.physicsBody?.node?.name = "Top"
        computerGoal.physicsBody?.contactTestBitMask = 1
        computerGoal.physicsBody?.collisionBitMask = 1
        addChild(computerGoal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        if ball.frame.contains(location) {
            ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 10))
        }
        
        player.position = CGPoint(x: location.x, y: player.position.y)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        
        player.position = CGPoint(x: location.x, y: player.position.y)
    }
    override func update(_ currentTime: TimeInterval){
        computer.run(SKAction.moveTo(x: ball.position.x, duration: 0.1))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "Bottom" {
            ball.removeFromParent()
            player.removeFromParent()
            label.text = "Computer Wins!"
        }
        if contact.bodyA.node?.name == "Top" {
            ball.removeFromParent()
            computer.removeFromParent()
            label.text = "Player Wins!"
        }
    }
}



struct PongView: View {
    var body: some View {
        GeometryReader(content: { geometry in
            SpriteView(scene: GameScene(size: geometry.size))
        })
    }
}

