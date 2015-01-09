//
//  MusicPlayerViewController.swift
//  Walker
//
//  Created by ODoganY on 23/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//

import UIKit

class MusicPlayerViewController: UIViewController, UIPickerViewDelegate {
    
    let robotController: Connection = Connection()

    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var bacwardButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var musicPPickerView: UIPickerView!
    
    var musicNames = ["Dogan Yirmibesoglu","Music","Music","Music","Music","Music","Music", "Batuhan Yapanoglu", "Eda Yigit"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicPPickerView.delegate = self
        robotController.connect()
        musicPPickerView.selectRow(1, inComponent: 0, animated: true)
        
    }
    
    
    @IBAction func playPauseButtonTapped(sender: AnyObject) {
        
         let playImage = UIImage(named:"playButtonpng.png") as UIImage!
         let pauseImage = UIImage(named:"pButton.png") as UIImage!
        
        if (playPauseButton.imageForState(UIControlState.Normal) == playImage) {
            
            playPauseButton.setImage(pauseImage, forState:UIControlState.Normal)
            robotController.sendMessage("set:PauseMusic\n")
        } else {
            
            playPauseButton.setImage(playImage, forState:UIControlState.Normal)
            robotController.sendMessage("set:PlayMusic\n")
            
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        //returns an integer
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return musicNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return musicNames[row]
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let musicData = musicNames[row]
        var myTitle = NSAttributedString(string: musicData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 8.0)!,NSForegroundColorAttributeName:UIColor.orangeColor() ])
        return myTitle
    }
    
        
         override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            robotController.closePort()
            println("portClosed")
    }

}