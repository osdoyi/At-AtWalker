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

    
    @IBAction func VolumeButtonTapped(sender: AnyObject) {
        
        let VolumeCLosed = UIImage(named:"volume_none.png") as UIImage!
        let VolumeOpened = UIImage(named:"volume.png") as UIImage!
        
        if (VolumeButton.imageForState(UIControlState.Normal) == VolumeOpened) {
           
            VolumeButton.setImage(VolumeCLosed, forState:UIControlState.Normal)
            robotController.connect()
            robotController.sendMessage("set:10\n")
            robotController.closePort()
        } else {
            //robotController.connect()
            VolumeButton.setImage(VolumeOpened, forState:UIControlState.Normal)
            robotController.connect()
            robotController.sendMessage("set:100\n")
            robotController.closePort()
        }
        
    }
    
    @IBAction func sliderDidChangeValue(sender: UISlider) {
        println(Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
//          let thumbImage = UIImage(named: "weapon-1")
//          weaponSlider.setThumbImage(thumbImage, forState: .Normal)
    }
    
    

    @IBAction func LightButtonTapped(sender: AnyObject) {
        
        let LightCLosed = UIImage(named:"light_none2.png") as UIImage!
        let LightOpened = UIImage(named:"light2.png") as UIImage!
        
        if (LightButton.imageForState(UIControlState.Normal) == LightOpened) {
            
            LightButton.setImage(LightCLosed, forState:UIControlState.Normal)
        } else {
            
            LightButton.setImage(LightOpened, forState:UIControlState.Normal)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    
}