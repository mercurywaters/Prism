//
//  AppDelegate.swift
//  Prism
//
//  Created by Faheem Chaudhary on 11/1/14.
//  Copyright (c) 2014 Faheem Inayat. All rights reserved.
//

import Cocoa

@NSApplicationMain
class PrismAppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        println ( "Aha ... this is the starting point" );
    }
    
}
