//
//  JoyStickScene.swift
//  Walker
//
//  Created by ODoganY on 24/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//

import SpriteKit

class JoyStickScene: SKScene, AnalogStickProtocol {
    
    
    let AnalogJoyStick: AnalogStick = AnalogStick()
    var robotController: Connection = Connection()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let bgDiametr: CGFloat = 170
        let thumbDiametr: CGFloat = 160
        let joysticksRadius = bgDiametr// / 5
        AnalogJoyStick.bgNodeDiametr = bgDiametr
        AnalogJoyStick.thumbNodeDiametr = thumbDiametr
        AnalogJoyStick.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        AnalogJoyStick.delagate = self
        AnalogJoyStick.thumbNode.position.x = 0
        AnalogJoyStick.thumbNode.position.y = 0
        self.addChild(AnalogJoyStick)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        super.touchesBegan(touches, withEvent: event)
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
    
    // MARK: AnalogStickProtocol
    func moveAnalogStick(analogStick: AnalogStick, velocity: CGPoint, angularVelocity: Float) {
        //var position = "headX: \(AnalogJoyStick.thumbNode.position.x), headY:\(AnalogJoyStick.thumbNode.position.y)"
    var position = "headX: \(Int(AnalogJoyStick.thumbNode.position.x)),headY: \(Int(AnalogJoyStick.thumbNode.position.y))"
        
    robotController.sendMessage(position)

    }
}
