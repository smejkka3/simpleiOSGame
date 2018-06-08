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
    
    func initShooterScene(){
        let shooterAtlas = SKTextureAtlas(named: "Shooter")
        
        for index in 1...shooterAtlas.textureNames.count{
            let imgName = String(format: "Shoot%01d", index)
            shooterAnimation += [shooterAtlas.textureNamed(imgName)]
        }
    }
}
