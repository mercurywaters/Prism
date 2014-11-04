//
//  StlBinaryParser.swift
//  Prism
//


import Foundation

class StlBinaryParser : StlParser {
    
    private let HEADER_LENGTH: Int = 80;
    private let NUMBER_OF_TRIAGNLES_LENGTH: Int = 4;
    private let TRIANGLE_RECORD_LENGTH: Int = 50;
    private let ATTRIBUTE_BYTE_COUNT_LENGTH = 2;
    
    func readTriangles ( #from: NSURL ) -> ( triangleCount: Int, triangles: [StlTriangle], error: NSError? ) {
    
        println ( "Entered into StlBinaryParser.readFacets method" );
        
        var numberOfTriangles: Int = 0;
        var triangles: [StlTriangle] = [StlTriangle]();
        
        var error: NSError? = nil;
        
        var fileReadingError: NSErrorPointer = NSErrorPointer ();
        
        var fileHandle = NSFileHandle ( forReadingFromURL: from, error: fileReadingError );
        
        if ( fileHandle != nil ) {
            
            var header = fileHandle?.readDataOfLength ( HEADER_LENGTH );
            var data = fileHandle?.readDataOfLength ( NUMBER_OF_TRIAGNLES_LENGTH );
            var numberOfRecords: UInt32 = 0;
            data?.getBytes( &numberOfRecords );
            
            numberOfTriangles = Int(numberOfRecords);
            
            println ( "We got \(numberOfTriangles) triangles" );
            
            for ( var i = 0; i < numberOfTriangles; i++ ) {

                var v0: Float32 = 0.0;
                var v1: Float32 = 0.0;
                var v2: Float32 = 0.0;
                
                v0 = read32BitsReal ( fromFile: fileHandle! );
                v1 = read32BitsReal ( fromFile: fileHandle! );
                v2 = read32BitsReal ( fromFile: fileHandle! );
                
                var normalVertex: StlVertex = StlVertex ( at0: v0, at1: v1, at2: v2 );

                v0 = read32BitsReal ( fromFile: fileHandle! );
                v1 = read32BitsReal ( fromFile: fileHandle! );
                v2 = read32BitsReal ( fromFile: fileHandle! );
                
                var x: StlVertex = StlVertex ( at0: v0, at1: v1, at2: v2 );
                
                v0 = read32BitsReal ( fromFile: fileHandle! );
                v1 = read32BitsReal ( fromFile: fileHandle! );
                v2 = read32BitsReal ( fromFile: fileHandle! );
                
                var y: StlVertex = StlVertex ( at0: v0, at1: v1, at2: v2 );
                
                v0 = read32BitsReal ( fromFile: fileHandle! );
                v1 = read32BitsReal ( fromFile: fileHandle! );
                v2 = read32BitsReal ( fromFile: fileHandle! );
                
                var z: StlVertex = StlVertex ( at0: v0, at1: v1, at2: v2 );
                
                var triangle: StlTriangle = StlTriangle ( normal: normalVertex, x: x, y: y, z: z );

                var attributeCount: UInt16 = 0;
                var attBytesData = fileHandle?.readDataOfLength( ATTRIBUTE_BYTE_COUNT_LENGTH );
                attBytesData?.getBytes ( &attributeCount );
                
                if ( attributeCount > 0 ) {
                    println ( "attribute Bytes Count is \(attributeCount) and is not ZERO ... don't know what to do next !!!!" );
                }
                
                triangles.append ( triangle );
            }
            
            fileHandle?.closeFile();
        }
        else {
            error = NSError( domain: fileReadingError.debugDescription, code: -1, userInfo: nil );
            println ( "Error occurred \(error)" );
        }
        
        println ( "Exiting from StlBinaryParser.readFacets method" );
        
        return ( numberOfTriangles, triangles, error );
    }
    
    private let DATA_SIZE_TO_READ_REAL32 = 4;
    private func read32BitsReal ( #fromFile: NSFileHandle ) -> ( Float32 ) {
        
        var returnValue: Float32 = 0.0;
        
        var data = fromFile.readDataOfLength( DATA_SIZE_TO_READ_REAL32 );
        
        data.getBytes ( &returnValue );
        
        return returnValue;
    }
    
}