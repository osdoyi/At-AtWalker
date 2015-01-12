//
//  CNBridge.m
//  fdsaf
//
//  Created by semih ozturk on 05/01/15.
//  Copyright (c) 2015 Saran. All rights reserved.
//

#import "CNBridge.h"
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation CNBridge

- (NSString *) currentWifiHotSpotName {
    
    NSString *wifiName = nil;
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        NSDictionary *info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        
        NSLog(@"info:%@",info);
        
        if (info[@"SSID"]) {
            wifiName = info[@"SSID"];
        }
    }
    return wifiName;
}
@end
