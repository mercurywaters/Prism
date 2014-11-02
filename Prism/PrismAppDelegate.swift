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
    
    func openfiledlg (title: String, message: String) -> String
    {
        var myFiledialog: NSOpenPanel = NSOpenPanel()
        
        myFiledialog.prompt = "Öffnen"
        myFiledialog.worksWhenModal = true
        myFiledialog.allowsMultipleSelection = false
        myFiledialog.canChooseDirectories = false
        myFiledialog.resolvesAliases = true
        myFiledialog.title = title
        myFiledialog.message = message
        myFiledialog.runModal()
        var chosenfile = myFiledialog.URL
            return ("")
    }
}
