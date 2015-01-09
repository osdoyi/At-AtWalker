//
//  CreditsViewController.swift
//  Walker
//
//  Created by ODoganY on 23/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var StaffPic: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var eduLabel: UILabel!
    @IBOutlet weak var contLabel: UILabel!
    
    
    var contributers = ["Dogan Yirmibesoglu","Mert Hayta", "Batuhan Yapanoglu", "Eda Yigit"]
    var imageNames = ["dogan.png","mert.png", "batuhan.png", "eda.png"]
    var info = ["Electronis & Mechanical Engineer","Electrical & Electronics Engineer", "Electrical & Electronics Engineer", "Architect"]
    var tit = ["Team Leader","Photoshop Guy", "Coder", "Precision Girl"]
    var edu = ["Ozyegin University","Ozyegin University", "Ozyegin University", "Ozyegin University"]
    var cont = ["Mech, Circuit, ios, Artistic design","Image designer for the apps", "Android app & Ardunio code", "Artistic design"]
    override func viewDidLoad() {
        super.viewDidLoad()
        PickerView.delegate = self
        PickerView.selectRow(1, inComponent: 0, animated: true)
        infoLabel.text = info[1]
        titleLabel.text = tit[1]
        eduLabel.text = edu[1]
        contLabel.text = cont[1]
        StaffPic.image = UIImage(named:imageNames[1]) as UIImage!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        //returns an integer
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return contributers.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return contributers[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // if row is selected do the following
        infoLabel.text = info[row]
        titleLabel.text = tit[row]
        eduLabel.text = edu[row]
        contLabel.text = cont[row]
        
        StaffPic.image = UIImage(named:imageNames[row]) as UIImage!
        
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = contributers[row]
        
        var myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 8.0)!,NSForegroundColorAttributeName:UIColor.orangeColor() ])
        return myTitle
    }
    
    // size the components of the UIPickerView
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 290
    }
    
    
    
    
}