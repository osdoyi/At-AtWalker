//
//  ViewController.swift
//  Walker
//
//  Created by ODoganY on 17/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//

import UIKit
import SystemConfiguration

class ViewController: UIViewController {
    
    
    @IBOutlet weak var LeftDoor: UIImageView!
    @IBOutlet weak var RightDoor: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityStatusChanged", name: "ReachStatusChanged", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func reachabilityStatusChanged() {
        if reachabilityStatus == kNOTREACHABLE
        {
            //
        }
    }
    deinit {
          NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
        }
   


    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: nil, animations: {
            self.LeftDoor.frame.origin.x = (0 - self.LeftDoor.frame.size.height)
            self.RightDoor.frame.origin.x = UIScreen.mainScreen().bounds.size.width
            
            } ) { (Bool) -> Void in
                
            self.performSegueWithIdentifier("animationSegue", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    }
    
}

