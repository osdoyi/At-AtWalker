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
    //    let mydashBoard: DashboardViewController = DashboardViewController()
    
    
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var bacwardButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var musicPPickerView: UIPickerView!
    
    var musicNames = ["Imperal Attack","Princess Leia's Theme","The Desert ","The Little People Work","Rescue of the Princess","Inner City", "Cantina Band", "Land of Sandpeople"]
    
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
            robotController.sendMessage("set:PlaySelectedMusic:\n")
        } else {
            
            playPauseButton.setImage(playImage, forState:UIControlState.Normal)
            robotController.sendMessage("set:PauseMusic\n")
            
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // if row is selected do the following
        let playImage = UIImage(named:"playButtonpng.png") as UIImage!
        var selectedMusic = "\(musicNames[row])"
        robotController.sendMessage("set:selectedMusic: \(selectedMusic)\n")
        playPauseButton.setImage(playImage, forState:UIControlState.Normal)
        robotController.sendMessage("set:PauseMusic\n")
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        robotController.closePort()
        println("portClosed")
        // mydashBoard.viewDidAppear(false)
    }
    
    
}