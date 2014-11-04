//
//  PrismView.swift
//  Prism
//


import SceneKit

class PrismView: SCNView {
    
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