//
//  SpriteNode.swift
//  CattleBattle
//
//  Created by Ding Ming on 26/3/15.
//  Copyright (c) 2015 Ding Ming. All rights reserved.
//
import UIKit
import SpriteKit

class StarNode: SKSpriteNode {
    
    var animalType : Animal.name = .empty
    
    class func getAnimal(location: CGPoint, direction : Int, type : Animal.name) -> StarNode {
        var animal = Animal(type : type)
        var imageName = animal.getImageName()
        let sprite = StarNode(imageNamed:imageName)
        sprite.animalType = type
        
        
        sprite.xScale = animal.getImageScale().0
        sprite.yScale = animal.getImageScale().1
        
//        sprite.xScale = 0.03
//        sprite.yScale = 0.03
        
        sprite.position = location
        if direction == 1 {
            sprite.name = "rightRunning"
        } else {
            sprite.name = "leftRunning"
        }
       
        var tex = SKTexture(imageNamed: imageName)
        
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
        
        return sprite
    }
    
   
    
}