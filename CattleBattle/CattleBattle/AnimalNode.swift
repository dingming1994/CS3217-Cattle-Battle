//
//  AnimalNode.swift
//  CattleBattle
//
//  Created by Duong Dat on 4/2/15.
//  Copyright (c) 2015 Cattle Battle. All rights reserved.
//

import UIKit
import SpriteKit

class AnimalNode: SKSpriteNode {
    
    var animalSize: Animal.Size = Animal.Size.TINY
    
    class func getAnimal(location: CGPoint, direction: Int, size: Animal.Size, side : GameModel.Side) -> AnimalNode {
        var color = Animal.Color.WHITE
        if side == .LEFT {
            color = .BLACK
        }
        
        var animal = Animal(color: color, size: size, status: .DEPLOYED)
        
        let sprite = AnimalNode(texture: animal.getTexture())
        sprite.animalSize = size
        
        
        sprite.xScale = animal.getImageScale().0
        sprite.yScale = animal.getImageScale().1
        
        sprite.position = location
        if direction == 1 {
            sprite.name = "rightRunning"
        } else {
            sprite.name = "leftRunning"
        }
        
       // var tex = animal.getTexture()
        
        //       sprite.physicsBody = SKPhysicsBody(texture: tex, size: sprite.size)
        var imageSize = CGSizeMake(sprite.size.width + (CGFloat)(3), sprite.size.height + (CGFloat)(3))
        
        //        var imageSize = CGSizeMake((CGFloat)(200),(CGFloat)(200))
        sprite.physicsBody = SKPhysicsBody(rectangleOfSize:imageSize)
        if let physics = sprite.physicsBody {
            physics.affectedByGravity = false
            physics.allowsRotation = false
            physics.dynamic = true
            physics.mass = 0.1
            physics.linearDamping = 0
            physics.angularDamping = 0
            physics.restitution = 0
            physics.friction = 0
            
            //            physics.velocity.dx = 50
            
            //            time = NSTimeInterval(
            //            var mvAction = SKAction.moveByX((CGFloat)(direction*30), y: 0, duration: (NSTimeInterval)(animal.getImageMass())/10)
            //            var mvforeverAction = SKAction.repeatActionForever(mvAction)
            //            sprite.runAction(mvforeverAction)
            
            physics.velocity.dx = (CGFloat)(direction) * 300 * animal.getImageMass()/10
        }

        var goatRunningFrames = animal.getDeployedTexture()
        //add running action
        sprite.runAction(SKAction.repeatActionForever(
            SKAction.animateWithTextures(goatRunningFrames,
                timePerFrame: 0.2,
                resize: false,
                restore: true)),
            withKey:"runningGoat")
        
        return sprite
    }
    
    
    
}