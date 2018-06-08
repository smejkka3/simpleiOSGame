//
//  GameScene.swift
//  myGame
//
//  Created by Karel Smejkal on 6/6/18.
//  Copyright © 2018 Karel Smejkal. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let introLabel = childNode(withName: "introLabel")
        
        if(introLabel != nil){
            let fadeOut = SKAction.fadeOut(withDuration: 0.25)
            
            introLabel?.run(fadeOut,completion: {
                let doors = SKTransition.doorway(withDuration: 0.5)
                let shooterScene = ShooterScene(fileNamed: "ShooterScene")
                self.view?.presentScene(shooterScene!,transition: doors)
            })
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
