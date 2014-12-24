//
//  DashboardViewController.swift
//  Walker
//
//  Created by ODoganY on 23/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var VolumeButton: UIButton!
    
    @IBOutlet weak var LightButton: UIButton!
    
    @IBOutlet weak var FireButton: UIButton!
    
    
    
    @IBAction func VolumeButtonTapped(sender: AnyObject) {
        
        let VolumeCLosed = UIImage(named:"volume_none.png") as UIImage!
        let VolumeOpened = UIImage(named:"volume.png") as UIImage!
        
        if (VolumeButton.imageForState(UIControlState.Normal) == VolumeOpened) {
           
            VolumeButton.setImage(VolumeCLosed, forState:UIControlState.Normal)
        } else {
            
           VolumeButton.setImage(VolumeOpened, forState:UIControlState.Normal)
        }
        
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}