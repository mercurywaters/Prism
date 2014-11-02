//
//  StlBinaryParser.swift
//  Prism
//
//  Created by Faheem Chaudhary on 11/1/14.
//  Copyright (c) 2014 Faheem Inayat. All rights reserved.
//

import Foundation

class StlBinaryParser : StlParser {

    var strictParsing: Bool = false;
    
    required init () {
        self.strictParsing = false;
    }
    
    required init(strictParsing: Bool) {
        self.strictParsing = strictParsing;
    }
    
    var numOfObjects: Int = 0;
    
    var numOfFacets: [Int] = [Int]();
    
    var objectNames: [String] = [String]();
    
    
    func read ( from: NSURL ) -> ( error: NSError?, parsingMessages: [String]? ) {
        return (nil, nil);
    }
    
    func close () -> ( NSError? ) {
        return nil;
    }
    
    func getNextFacets (upTo: Int) -> ( vertices: [StlVertex], actualCount: Int, endOfFacets: Bool, error: NSError? ) {
        var vertices: [StlVertex] = [StlVertex]();
        var actualCount: Int = 0;
        var endOfFacets: Bool = false;
        
        return ( vertices, actualCount, endOfFacets, nil );
    }

}