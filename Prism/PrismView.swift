//
//  PrismView.swift
//  Prism
//


import SceneKit

class PrismView: SCNView {
    
    override init(frame: NSRect, options: [NSObject : AnyObject]?) {
        super.init(frame: frame, options: options);
        self.configureView();
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect);
        self.configureView();
    }
    
    override init() {
        super.init();
        self.configureView();
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder);
        self.configureView();
    }
    
    private func configureView () {

        // allows the user to manipulate the camera
        self.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        self.showsStatistics = false;
        
        // configure the view
        self.backgroundColor = NSColor.blackColor()
        
    }
    
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
        // check what nodes are clicked
//        var p = self.convertPoint(theEvent.locationInWindow, fromView: nil)
//        
//        var hitRes = hitTest(p, options: nil);
//
//        if ( hitRes != nil ) {
//    
//            // check that we clicked on at least one object
//            let hitResults = hitRes as [SCNHitTestResult];
//            if hitResults.count > 0 {
//            
//                // retrieved the first clicked object
//                let result: AnyObject = hitResults[0]
//                
//                // get its material
//                let material = result.node!.geometry!.firstMaterial!
//                
//                // highlight it
//                SCNTransaction.begin()
//                SCNTransaction.setAnimationDuration(0.5)
//                
//                // on completion - unhighlight
//                SCNTransaction.setCompletionBlock() {
//                
//                    SCNTransaction.begin()
//                    SCNTransaction.setAnimationDuration(0.5)
//                    
//                    material.emission.contents = NSColor.blackColor()
//                    
//                    SCNTransaction.commit()
//                }
//                
//                material.emission.contents = NSColor.redColor()
//                
//                SCNTransaction.commit()
//            }
//        }
        
        super.mouseDown(theEvent)
    }
    
}