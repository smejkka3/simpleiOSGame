//
//  ShooterScene.swift
//  myGame
//
//  Created by Karel Smejkal on 6/8/18.
//  Copyright © 2018 Karel Smejkal. All rights reserved.
//

import UIKit
import SpriteKit

class ShooterScene: SKScene {
    
    var score = 0
    var enemyCount = 10
    var MainGuy = SKSpriteNode()
    
    var shooterAnimation = [SKTexture]()

    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -1.2)
        self.initShooterScene()
        
    }
    
    //set up level
    func initShooterScene(){
        let shooterAtlas = SKTextureAtlas(named: "shooter")
        
        for index in 1...shooterAtlas.textureNames.count{
            let imgName = "RunShoot\(index).png"
            shooterAnimation += [shooterAtlas.textureNamed(imgName)]
        }
        MainGuy = SKSpriteNode(imageNamed: shooterAtlas.textureNames[0] as! String)
        
        MainGuy.size = CGSize(width: 70, height: 140)
        MainGuy.position = CGPoint(x: self.size.width / 3, y: self.size.height / 3)
        self.addChild(MainGuy)
    }
    
    //animate the shooter
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let shooterNode = self.childNode(withName: "shooterNode")
        
        if(shooterNode != nil){
            let animation = SKAction.animate(withNormalTextures: shooterAnimation, timePerFrame: 0.1)
            
            //fire bullet
            let shootBullet = SKAction.run({
                let bulletNode = self.createBUlletNode()
                self.addChild(bulletNode)
                bulletNode.physicsBody?.applyImpulse(CGVector(dx: 160.0,dy: 0.0))
            })
            
            let sequence = SKAction.sequence([animation,shootBullet])
            
            shooterNode?.run(sequence)
        }
    }
    
    //create bullet
    func createBUlletNode() -> SKSpriteNode {
        let shooterNode = self.childNode(withName: "shooterNode")
        let shooterPostition = shooterNode?.position
        let shooterWidth = shooterNode?.frame.size.width
        
        let bullet = SKSpriteNode(imageNamed: "Bullet_000.png")
        bullet.position = CGPoint(x: shooterPostition!.x + shooterWidth!/2, y: shooterPostition!.y)
        bullet.name = "bulltetNode"
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.frame.size)
        bullet.physicsBody?.usesPreciseCollisionDetection = true
        
        return bullet
        
    }
}
