//
//  AppDelegate.swift
//  Walker
//
//  Created by ODoganY on 17/12/14.
//  Copyright (c) 2014 osdoyi. All rights reserved.
//

import UIKit
import SystemConfiguration


let kREACHABLEWITHWIFI = "ReachableWithWIFI"
let kNOTREACHABLE = "NotReachable"
let kREACHABLEWITHWWAN = "ReachableWithWWAN"

var reachability: Reachability?
var reachabilityStatus = kREACHABLEWITHWIFI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var internetReach: Reachability?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged:", name: kReachabilityChangedNotification, object: nil)
        
        internetReach = Reachability.reachabilityForLocalWiFi()
        internetReach?.startNotifier()
        
        if internetReach != nil{
            self.statusChangedWithReachability(internetReach!)
        }
        
        return true
    }
    //    func getCurrentWifiHotSpotName() -> NSString {
    //        var wifiName: NSString = ""
    //        var myArray: NSArray = NSArray(CNCopySupportedInterfaces().release())
    //        println(myArray)
    //        var myDict: CFDictionaryRef = CNCopySupportedInterfaces()
    //        // burdaki sorun nasil cozulur ?
    //        // http://stackoverflow.com/questions/4712535/how-do-i-use-captivenetwork-to-get-the-current-wifi-hotspot-name
    //        return wifiName
    //    }
    
    func reachabilityChanged(notification: NSNotification){
        println("Reachibility Status Changed....")
        reachability = notification.object as? Reachability
        self.statusChangedWithReachability(reachability!)
    }
    
    
    func statusChangedWithReachability(currentReachabilityStatus: Reachability)
    {
        var networkStatus: NetworkStatus = currentReachabilityStatus.currentReachabilityStatus()
        var statusString: String = ""
        
        println("StatusValue: \(networkStatus.value)")
        
        if networkStatus.value == NotReachable.value{
            println("Network is not reachable...")
            reachabilityStatus = kNOTREACHABLE
        }
        else if networkStatus.value == ReachableViaWiFi.value {
            println("Network is reachable via Wifi..")
            reachabilityStatus = kREACHABLEWITHWIFI
        } else if networkStatus.value == ReachableViaWWAN.value {
            println("Reachable via WWAN")
            reachabilityStatus = kREACHABLEWITHWWAN
        }
        NSNotificationCenter.defaultCenter().postNotificationName("ReachStatusChanged", object: nil)
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        NSNotificationCenter.defaultCenter().removeObserver(self, name: kReachabilityChangedNotification, object: nil)
    }
    
    
}

