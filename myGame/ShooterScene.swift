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
    var shooterAnimation = [SKTexture]()

    override func didMove(to view: SKView) {
        self.initShooterScene()
        
    }
    
    //set up level
    func initShooterScene(){
        let shooterAtlas = SKTextureAtlas(named: "Shooter")
        
        for index in 1...shooterAtlas.textureNames.count{
            let imgName = "Shoot\(index).png"
            shooterAnimation += [shooterAtlas.textureNamed(imgName)]
        }
    }
    
    //animate the shooter
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let shooterNode = self.childNode(withName: "shooterNode")
        
        if(shooterNode != nil){
            let animation = SKAction.animate(withNormalTextures: shooterAnimation, timePerFrame: 1.0)
            shooterNode?.run(animation)
        }
    }
}
