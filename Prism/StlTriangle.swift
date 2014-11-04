//
//  StlVertex.swift
//  Prism
//


import Foundation

class StlVertex {
    
    var index0: Float32 = 0.0;
    var index1: Float32 = 0.0;
    var index2: Float32 = 0.0;
    
    init () {
    }
    
    init ( at0: Float32, at1: Float32, at2: Float32 ) {
        
        index0 = at0;
        index1 = at1;
        index2 = at2;
    }
}

class StlTriangle {

    var normal: StlVertex;
    
    var x: StlVertex;
    var y: StlVertex;
    var z: StlVertex;
    
    var attribureByteCount: UInt16 = 0;
    var attributes: NSData = NSData();
    
    init () {
        
        self.normal = StlVertex();
        self.x = StlVertex();
        self.y = StlVertex();
        self.z = StlVertex();
    }
    
    init ( normal: StlVertex, x: StlVertex, y: StlVertex, z: StlVertex ) {
        self.normal = normal;
        self.x = x;
        self.y = y;
        self.z = z;
    }
    
    func setAttributes ( #byteCount: UInt16, andData: NSData ) {
    
        self.attribureByteCount = byteCount;
        self.attributes = andData;
    }
    
}