//
//  GameScene.swift
//  balloonFun
//
//  Created by Vallard Benincosa on 12/27/17.
//  Copyright © 2017 Vallard Benincosa. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let balloons = [SKSpriteNode(imageNamed: "pink-balloon"),
                   SKSpriteNode(imageNamed: "orange-balloon"),
                   SKSpriteNode(imageNamed: "green-balloon"),
                   SKSpriteNode(imageNamed: "yellow-balloon")]
    let background = SKSpriteNode(imageNamed: "clouds")
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        background.size = frame.size
        //background.alpha = 0.5
        addChild(background)
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 2)
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addBalloon),
                SKAction.wait(forDuration: 1.0)
                ])
        ))
        
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
    func addBalloon() {
        let randomIndex = Int(arc4random_uniform(UInt32(self.balloons.count)))
        let balloon = self.balloons[randomIndex].copy() as! SKSpriteNode
        let randomX = random(min: balloon.size.width/2, max: size.width - balloon.size.width/2)
        balloon.position = CGPoint(x: randomX, y: 0 - balloon.size.height*0.2/2)
        balloon.setScale(0.2)
        
        balloon.physicsBody = SKPhysicsBody()
        if let physics = balloon.physicsBody {
            physics.affectedByGravity = true
            physics.allowsRotation = true
            physics.linearDamping = 0.75
            physics.angularDamping = 0.75
        }
        self.addChild(balloon)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        /*let n = self.balloon.copy() as! SKSpriteNode
        n.position = pos
        self.addChild(n)*/
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
