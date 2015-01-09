//
//  DashboardViewController.swift
//  Walker
//
//  Created by ODoganY on 23/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//

import UIKit
import SpriteKit
import SceneKit


class DashboardViewController: UIViewController {
    
    let robotController: Connection = Connection()

    
    @IBOutlet weak var VolumeButton: UIButton!
    @IBOutlet weak var LightButton: UIButton!
    @IBOutlet weak var FireButton: UIButton!
    @IBOutlet weak var joyView: UIView!
    @IBOutlet weak var weaponSlider: UISlider!
    @IBOutlet weak var sensButton: UIButton!
    @IBOutlet weak var StormButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!

    
    @IBAction func VolumeButtonTapped(sender: AnyObject) {
        
        let VolumeCLosed = UIImage(named:"volume_none.png") as UIImage!
        let VolumeOpened = UIImage(named:"volume.png") as UIImage!
        
        if (VolumeButton.imageForState(UIControlState.Normal) == VolumeOpened) {
           
            VolumeButton.setImage(VolumeCLosed, forState:UIControlState.Normal)
            robotController.sendMessage("set:VolumeClosed\n")
        } else {
            VolumeButton.setImage(VolumeOpened, forState:UIControlState.Normal)
            robotController.sendMessage("set:VolumeOpened\n")
          
        }
        
    }
    
    @IBAction func sliderDidChangeValue(sender: UISlider) {
        println(Int(sender.value))
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        robotController.connect()
        // Configure the view.
          let scene = JoyStickScene(size: joyView.bounds.size)
          let JoView = joyView as SKView
//        /* Sprite Kit applies additional optimizations to improve rendering performance */
          JoView.ignoresSiblingOrder = true
          JoView.allowsTransparency = true
//        /* Set the scale mode to scale to fit the window */
          scene.scaleMode = .AspectFit
          scene.backgroundColor = UIColor(patternImage: UIImage(named: "dogan.png")!)
          JoView.presentScene(scene)
          weaponSlider.transform = CGAffineTransformRotate(weaponSlider.transform,270.0/180 * CGFloat(M_PI));
          let thumbImage = UIImage(named: "weaponnew")
          weaponSlider.setThumbImage(thumbImage, forState: .Normal)
    }
    
    

    @IBAction func LightButtonTapped(sender: AnyObject) {
        
        let LightCLosed = UIImage(named:"light_none2.png") as UIImage!
        let LightOpened = UIImage(named:"light2.png") as UIImage!
        
        if (LightButton.imageForState(UIControlState.Normal) == LightOpened) {
            
            LightButton.setImage(LightCLosed, forState:UIControlState.Normal)
            robotController.sendMessage("set:LightsClosed\n")
        } else {
            
            LightButton.setImage(LightOpened, forState:UIControlState.Normal)
            robotController.sendMessage("set:LightsOpened\n")
           
        }
    }
    
    @IBAction func SensButtonTapped(sender: AnyObject) {
        let SensCLosed = UIImage(named:"pir.png") as UIImage!
        let SensOpened = UIImage(named:"pirOpened.png") as UIImage!
        
        if (sensButton.imageForState(UIControlState.Normal) == SensOpened) {
            
            sensButton.setImage(SensCLosed, forState:UIControlState.Normal)
            robotController.sendMessage("set:SensorsClosed\n")
        } else {
            
            sensButton.setImage(SensOpened, forState:UIControlState.Normal)
            robotController.sendMessage("set:SensorsOpened\n")
        }
    }
    
    @IBAction func StromButtonTapped(sender: AnyObject) {
        
        let StormCLosed = UIImage(named:"stormtrooper.png") as UIImage!
        let StormOpened = UIImage(named:"stormtrooperOpened.png") as UIImage!
        
        if (StormButton.imageForState(UIControlState.Normal) == StormOpened) {
            
            StormButton.setImage(StormCLosed, forState:UIControlState.Normal)
            robotController.sendMessage("set:StormClosed\n")
        } else {
            
            StormButton.setImage(StormOpened, forState:UIControlState.Normal)
            robotController.sendMessage("set:StromOpened\n")
        }
    }
    
    
    @IBAction func VaderButtonTapped(sender: AnyObject) {
        let VaderCLosed = UIImage(named:"vader.png") as UIImage!
        let VaderOpened = UIImage(named:"VaderOpened.png") as UIImage!
        
        if (vaderButton.imageForState(UIControlState.Normal) == VaderOpened) {
            
            vaderButton.setImage(VaderCLosed, forState:UIControlState.Normal)
            robotController.sendMessage("set:VaderClosed\n")
        } else {
            
            vaderButton.setImage(VaderOpened, forState:UIControlState.Normal)
            robotController.sendMessage("set:VaderOpened\n")
        }
        
    }
    
    @IBAction func FireButtonTapped(sender: AnyObject) {
        robotController.sendMessage("set:FireFireFire\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        robotController.closePort()
        println("portClosed")
    }

    
}