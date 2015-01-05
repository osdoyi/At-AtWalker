#import <SystemConfiguration/CaptiveNetwork.h>

NSString *currentSSID = @"";
CFArrayRef myArray = CNCopySupportedInterfaces();
if (myArray != nil){
   NSDictionary* myDict = (NSDictionary *) CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0));
   if (myDict!=nil){
      currentSSID=[myDict valueForKey:@"SSID"]; 
   } else {
      currentSSID=@"<<NONE>>"; 
   }        
} else {
   currentSSID=@"<<NONE>>"; 
}