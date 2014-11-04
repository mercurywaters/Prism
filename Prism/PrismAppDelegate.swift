//
//  AppDelegate.swift
//  Prism
//


import Cocoa

@NSApplicationMain
class PrismAppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let pathtoapplication: String = NSBundle.mainBundle().bundlePath;
        println ( "Running in \(pathtoapplication)" );
    }
    
//    func openfiledlg (title: String, message: String) -> String
//    {
//        var myFiledialog: NSOpenPanel = NSOpenPanel()
//        
//        myFiledialog.prompt = "Open"
//        myFiledialog.worksWhenModal = true
//        myFiledialog.allowsMultipleSelection = false
//        myFiledialog.canChooseDirectories = false
//        myFiledialog.resolvesAliases = true
//        myFiledialog.title = title
//        myFiledialog.message = message
//        myFiledialog.runModal()
//        var chosenfile = myFiledialog.URL
//            return ("")
//    }
}
