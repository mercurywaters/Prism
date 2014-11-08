//
//  PrismViewController.swift
//  Prism
//
//

import SceneKit
import QuartzCore

class PrismViewController: NSViewController {
    
    var scene: SCNScene = SCNScene();
    
    @IBOutlet weak var gameView: PrismView!
    
    override func awakeFromNib(){
        // create a new scene
//      scene = SCNScene(named: "art.scnassets/ship.dae")!
//        scene = SCNScene();
        
        if (true) {
            // create and add a camera to the scene
            let cameraNode = SCNNode()
            cameraNode.camera = SCNCamera()
            scene.rootNode.addChildNode(cameraNode)
            
            // place the camera
            cameraNode.position = SCNVector3(x: 0, y: 0, z: 60)
        }

        if (true) {
            // create and add a light to the scene
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light!.type = SCNLightTypeOmni
            lightNode.position = SCNVector3(x: 10, y: 10, z: 10)
            scene.rootNode.addChildNode(lightNode)
        }
        
        if (true) {
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light!.type = SCNLightTypeOmni
            lightNode.position = SCNVector3(x: -10, y: -10, z: -10)
            scene.rootNode.addChildNode(lightNode)
        }
        
        if (true) {
            // create and add an ambient light to the scene
            let ambientLightNode = SCNNode()
            ambientLightNode.light = SCNLight()
            ambientLightNode.light!.type = SCNLightTypeAmbient
            ambientLightNode.light!.color = NSColor.darkGrayColor()
            scene.rootNode.addChildNode(ambientLightNode)
        }
        
        if (true) {
            // create and add an ambient light to the scene
            let ambientLightNode = SCNNode()
            ambientLightNode.light = SCNLight()
            ambientLightNode.light!.type = SCNLightTypeAmbient
            ambientLightNode.light!.color = NSColor.orangeColor()
            scene.rootNode.addChildNode(ambientLightNode)
        }
        
        // retrieve the ship node
//        let ship = scene.rootNode.childNodeWithName("ship", recursively: true)!
        
        // animate the 3d object
//        let animation = CABasicAnimation(keyPath: "rotation")
//        animation.toValue = NSValue(SCNVector4: SCNVector4(x: CGFloat(0), y: CGFloat(1), z: CGFloat(0), w: CGFloat(M_PI)*2))
//        animation.duration = 3
//        animation.repeatCount = MAXFLOAT //repeat forever
//        ship.addAnimation(animation, forKey: nil)
        
        // set the scene to the view
        self.gameView!.scene = scene
    }
    
    private final let LOADED_OBJECT_NAME: String = "loadedObject";
    private final let FILE_PROTOCOL_PREFIX: String = "file://";
    private final let PROJECT_NAME: String = "Prism";
    
    func loadFile ( #fromStl: NSURL ) {
        
        var stlFileNode = SceneLoaderFromStl.loadSceneFromStl ( fromStl );
        
        if ( stlFileNode != nil ) {
            // unload the existing open object, if any
            scene.rootNode.childNodeWithName ( LOADED_OBJECT_NAME , recursively: true )?.removeFromParentNode();
            
            stlFileNode?.name = LOADED_OBJECT_NAME;
            scene.rootNode.addChildNode ( stlFileNode! );
            
            var fileName: String = fromStl.absoluteString!;
            
            if ( fileName.lowercaseString.hasPrefix( FILE_PROTOCOL_PREFIX ) ) {
                fileName = fileName.substringFromIndex( FILE_PROTOCOL_PREFIX.endIndex );
            }
            
            self.view.window?.title = PROJECT_NAME + " - " + fileName;
        }
    }
    
    func closeOpenFile () {
        // unload the existing open object, if any
        scene.rootNode.childNodeWithName ( LOADED_OBJECT_NAME , recursively: true )?.removeFromParentNode();
        self.view.window?.title = PROJECT_NAME;
    }
    
    
    //Lets one choose a file to send to the STL parser
    @IBAction func fileOpen ( sender: AnyObject ) {
        
        let stlFileDialog: NSOpenPanel = NSOpenPanel();
        stlFileDialog.allowsMultipleSelection = false;
        stlFileDialog.canChooseDirectories = false;
        stlFileDialog.canChooseFiles = true;
        stlFileDialog.resolvesAliases = true;
        stlFileDialog.allowedFileTypes = [ "stl" ];
        stlFileDialog.title = "Choose STL File";
        
        let userAction: Int = stlFileDialog.runModal();
        
        if ( userAction == NSFileHandlingPanelOKButton ) {
            loadFile(fromStl: stlFileDialog.URL!);
        }
    }

//    @IBOutlet weak var filePath: NSTextField!

    @IBAction func fileClose ( sender: AnyObject ) {
        closeOpenFile();    
    }
}
