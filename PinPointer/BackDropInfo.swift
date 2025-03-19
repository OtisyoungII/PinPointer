//
//  BackDropInfo.swift
//  PinPointer
//
//  Created by Otis Young on 3/15/25.
//

import SpriteKit
import UIKit

class GameScene: SKScene {
    var scoreLabel: SKLabelNode!
    var timerLabel: SKLabelNode!
    var score = 0
    var timer = 10.0
    var targetNodes = [SKSpriteNode]()
    var timerAction: SKAction?

    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        
        // Create and display score label
        scoreLabel = SKLabelNode(fontNamed: "Arial")
        scoreLabel.fontSize = 24
        scoreLabel.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 40)
        scoreLabel.text = "Score: \(score)"
        self.addChild(scoreLabel)
        
        // Create and display timer label
        timerLabel = SKLabelNode(fontNamed: "Arial")
        timerLabel.fontSize = 24
        timerLabel.position = CGPoint(x: self.frame.midX, y: self.frame.maxY - 70)
        timerLabel.text = "Time: \(Int(timer))"
        self.addChild(timerLabel)
        
        // Start the game
        startGame()
    }

    func startGame() {
        // Start the timer countdown
        let wait = SKAction.wait(forDuration: 1.0)
        let countdown = SKAction.run {
            self.timer -= 1
            self.timerLabel.text = "Time: \(Int(self.timer))"
            
            // Adjust the timer difficulty: decrease more quickly as the score increases
            if self.score >= 5 {
                self.timer -= 0.5  // Decrease by an additional 0.5 seconds once score reaches 5
            }
            if self.timer <= 0 {
                self.endGame()
            }
        }
        timerAction = SKAction.repeatForever(SKAction.sequence([wait, countdown]))
        self.run(timerAction!)
        
        // Spawn the first target
        spawnTarget()
    }

    func spawnTarget() {
        // Create a target and place it at a random position
        let target = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        target.position = CGPoint(x: CGFloat.random(in: 0..<self.frame.width), y: CGFloat.random(in: 0..<self.frame.height - 100))
        
        self.addChild(target)
        targetNodes.append(target)
        
        // Make the target disappear after 2 seconds
        let removeAction = SKAction.fadeOut(withDuration: 0.5)
        let removeAndDelete = SKAction.sequence([removeAction, SKAction.removeFromParent()])
        target.run(removeAndDelete)
    }

    func endGame() {
        self.removeAllActions()
        let endLabel = SKLabelNode(fontNamed: "Arial")
        endLabel.fontSize = 40
        endLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        endLabel.text = "Game Over\nScore: \(score)"
        endLabel.numberOfLines = 2
        self.addChild(endLabel)
    }

    // Handle touches (including Apple Pencil)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // Check if the touch is from Apple Pencil (type is .direct)
            if touch.type == .direct {
                let location = touch.location(in: self)
                
                // Check if the touch is on any target
                for target in targetNodes {
                    if target.contains(location) {
                        target.removeFromParent()  // Remove the target
                        score += 1  // Increase score
                        scoreLabel.text = "Score: \(score)"  // Update score label
                        spawnTarget()  // Spawn a new target
                    }
                }
            }
        }
    }

    override func update(_ currentTime: TimeInterval) {
        // Here, you could also adjust the timer or do additional adjustments if needed.
    }
}
