//
//  StlBinaryParserTests.swift
//  Prism
//
//  Created by Faheem Chaudhary on 11/2/14.
//  Copyright (c) 2014 Faheem Inayat. All rights reserved.
//

import Cocoa
import XCTest

class StlBinaryParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testExample() {
//        // This is an example of a functional test case.
//        XCTAssert(true, "Pass")
//    }
    
    func testReadFacets () {
    
        var parser: StlBinaryParser = StlBinaryParser();
        
        var filePath: NSURL? = NSURL ( fileURLWithPath: "/Users/faheemc/work/3dp/CF-TypeI.stl" );
        
        parser.readTriangles ( from: filePath! );

    }

    func testReadFacets2 () {
        
        var parser: StlBinaryParser = StlBinaryParser();
        
        var filePath: NSURL? = NSURL ( fileURLWithPath: "/Users/faheemc/Downloads/jaws.stl" );
        
        parser.readTriangles ( from: filePath! );
        
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
