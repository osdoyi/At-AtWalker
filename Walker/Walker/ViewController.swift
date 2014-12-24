//
//  ViewController.swift
//  Walker
//
//  Created by ODoganY on 17/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //setAnimationDelegate(delegate: AnyObject?)
    var delegate: AnyObject!
    
    @IBOutlet weak var LeftDoor: UIImageView!
    @IBOutlet weak var RightDoor: UIImageView!
    @IBOutlet weak var HeadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // NSLog("xxx")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(animated: Bool) {
        HeadButton.alpha = 0
        
        UIView.animateWithDuration(2.5, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 3, options: nil, animations: {
            self.LeftDoor.frame.origin.x = (0 - self.LeftDoor.frame.size.height)
            self.RightDoor.frame.origin.x = UIScreen.mainScreen().bounds.size.width
            
            } ) { (Bool) -> Void in
        }
        
        UIView.animateWithDuration(2, delay: 0, options: nil, animations: {
            self.HeadButton.alpha = 1
            }) { (Bool) -> Void in
                
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    }
    
    
//    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
//        NSLog("xxx")
//    }
   

    
    
}
