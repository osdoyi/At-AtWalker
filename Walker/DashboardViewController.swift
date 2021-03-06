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
import SystemConfiguration


class DashboardViewController: UIViewController {
    
    let robotController: Connection = Connection()
    var isOpen = 0
    
    @IBOutlet weak var VolumeButton: UIButton!
    @IBOutlet weak var LightButton: UIButton!
    @IBOutlet weak var FireButton: UIButton!
    @IBOutlet weak var joyView: UIView!
    @IBOutlet weak var weaponSlider: UISlider!
    @IBOutlet weak var sensButton: UIButton!
    @IBOutlet weak var StormButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var doorLeft: UIImageView!
    @IBOutlet weak var doorRight: UIImageView!
    
    
    
    
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
        var sliderData = ("set:Slider Position into:\(Int(sender.value))\n")
        robotController.sendMessage(sliderData)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        robotController.connect()
        
        // Configure the view.
        let scene = JoyStickScene(size: joyView.bounds.size)
        scene.robotController = robotController
        let JoView = joyView as SKView
        
        // Sprite Kit applies additional optimizations to improve rendering performance
        JoView.ignoresSiblingOrder = true
        JoView.allowsTransparency = true
        
        // Set the scale mode to scale to fit the window
        scene.scaleMode = .AspectFit
        scene.backgroundColor = UIColor(patternImage: UIImage(named: "dogan.png")!)
        JoView.presentScene(scene)
        
        // Setting slider
        weaponSlider.transform = CGAffineTransformRotate(weaponSlider.transform,270.0/180 * CGFloat(M_PI));
        let thumbImage = UIImage(named: "weaponnew")
        weaponSlider.setThumbImage(thumbImage, forState: .Normal)
        
        //Reachability Status
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityStatusChanged", name: "ReachStatusChanged", object: nil)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        myAnimation()
    }
    
    
    
    func myAnimation() {
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: nil, animations: {
            println(self.doorLeft.frame.origin.x)
            
            self.doorLeft.frame.origin.x = 0 - self.doorLeft.frame.size.height
            self.doorRight.frame.origin.x = UIScreen.mainScreen().bounds.size.width
            } ) { (Bool) -> Void in
                println(self.doorLeft.frame.origin.x)
                self.doorRight.alpha = 0
                self.doorLeft.alpha = 0
        }
        
    }

    
    func reachabilityStatusChanged() {
        if reachabilityStatus == kNOTREACHABLE{
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
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