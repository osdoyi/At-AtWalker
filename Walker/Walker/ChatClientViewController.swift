//
//  ChatClientViewController.swift
//  Walker
//
//  Created by ODoganY on 4/1/15.
//  Copyright (c) 2015 osdoyi. All rights reserved.
//

import Foundation
import CoreFoundation

class Connection : NSObject, NSStreamDelegate {
    let serverAddress: CFString = "192.168.2.20"
    let serverPort: UInt32 = 8080
    
    private var inputStream: NSInputStream!
    private var outputStream: NSOutputStream!
    
    func connect() {
        println("connecting...")
        
        var readStream:  Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        CFStreamCreatePairWithSocketToHost(nil, self.serverAddress, self.serverPort, &readStream, &writeStream)
        
        self.inputStream = readStream!.takeRetainedValue()
        self.outputStream = writeStream!.takeRetainedValue()
        
        self.inputStream.delegate = self
        self.outputStream.delegate = self
        
        self.inputStream.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        self.outputStream.scheduleInRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        
        self.inputStream.open()
        self.outputStream.open()
    }
    

    func closePort() {
        self.inputStream.close()
        self.outputStream.close()
        
    }
    
    func stream(stream: NSStream, handleEvent eventCode: NSStreamEvent) {
        println("stream event")
    }
    
    
    func sendMessage(string: NSString){
        var response: NSString = string
        println(response)
        var data: NSData = response.dataUsingEncoding(NSASCIIStringEncoding)!
        outputStream.write(UnsafePointer<UInt8>(data.bytes), maxLength: data.length)
        println(outputStream)
    }

    
    
}
