//
//  StlImporter.swift
//  Prism
//


import Foundation
import SceneKit

class SceneLoaderFromStl {

    class func loadSceneFromStl ( filePath: NSURL ) -> ( SCNNode? ) {
    
        var parser: StlParser = StlBinaryParser();
        
        var stlFile = parser.readTriangles ( from: filePath );

        var triangleCount = stlFile.triangleCount;
        var triangles = stlFile.triangles;
        println ( " \(triangleCount) triangles read from file " );
        
        var vertices: [SCNVector3] = [SCNVector3]();
        var normals: [SCNVector3] = [SCNVector3]();
        var indices: [Int32] = [Int32] ();
        
        for ( var i = 0; i < triangleCount; i++ ) {
            
            var triangle = triangles [ i ];
            
            let pointX = SCNVector3Make ( CGFloat(triangle.x.index0), CGFloat(triangle.x.index1), CGFloat(triangle.x.index2) );
            let pointY = SCNVector3Make ( CGFloat(triangle.y.index0), CGFloat(triangle.y.index1), CGFloat(triangle.y.index2) );
            let pointZ = SCNVector3Make ( CGFloat(triangle.z.index0), CGFloat(triangle.z.index1), CGFloat(triangle.z.index2) );
        
            let normal = SCNVector3Make ( CGFloat(triangle.normal.index0), CGFloat(triangle.normal.index1), CGFloat(triangle.normal.index2) );
            
            vertices.append ( pointX );
            vertices.append ( pointY );
            vertices.append ( pointZ );
            
            normals.append (normal);

            indices.append ( i * 3 + 0 );
            indices.append ( i * 3 + 1 );
            indices.append ( i * 3 + 2 );
        }
        
        let verticesSource = SCNGeometrySource ( vertices: UnsafePointer<SCNVector3>(vertices), count: vertices.count );
        let normalsSource = SCNGeometrySource ( normals: UnsafePointer<SCNVector3>(vertices), count: normals.count );
        let data = NSData (bytes: indices, length: (sizeof(Int32) * indices.count ) );
        let geoElements = SCNGeometryElement (
            data: data,
            primitiveType: SCNGeometryPrimitiveType.Triangles,
            primitiveCount: indices.count,
            bytesPerIndex: sizeof(Int32) );
        
        let geo = SCNGeometry ( sources: [verticesSource, normalsSource], elements: [geoElements] );
        var node = SCNNode ( geometry: geo );
        
        return node;
    }
}