//
//  AnalogJoystick.swift
//  Walker
//
//  Created by ODoganY on 24/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//


import SpriteKit

class AnalogJoystick: SKScene {
    
    var appleNode: SKSpriteNode?
    let moveAnalogStick: AnalogStick = AnalogStick()
    
    override func didMoveToView(view: SKView) {
        
        /* Setup your scene here */
        let bgDiametr: CGFloat = 200
        let thumbDiametr: CGFloat = 80
        let joysticksRadius = bgDiametr // / 5
        moveAnalogStick.bgNodeDiametr = bgDiametr
        moveAnalogStick.thumbNodeDiametr = thumbDiametr
        moveAnalogStick.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        moveAnalogStick.delagate = self
        self.addChild(moveAnalogStick)
       
        if let aN = appleNode {
            aN.physicsBody = SKPhysicsBody(texture: aN.texture, size: aN.size)
            aN.position = CGPointMake(100,100)
            aN.physicsBody?.affectedByGravity = false;
            self.insertChild(aN, atIndex: 0)
        }
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
    
    }

    
}
