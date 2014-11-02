//
//  StlParser.swift
//  Prism
//
//  Created by Faheem Chaudhary on 11/1/14.
//  Copyright (c) 2014 Faheem Inayat. All rights reserved.
//

import Foundation

protocol StlParser {

    var numOfObjects: Int { get }
    var numOfFacets: [Int] { get }
    var objectNames: [String] { get }
    

    init ()
    init ( strictParsing: Bool )
    
    func read ( from: NSURL ) -> ( error: NSError?, parsingMessages: [String]? )
    func close () -> ( NSError? )

    func getNextFacets (upTo: Int) -> ( vertices: [StlVertex], actualCount: Int, endOfFacets: Bool, error: NSError? )
}