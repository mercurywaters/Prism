//
//  StlParser.swift
//  Prism
//
//  Created by Faheem Chaudhary on 11/1/14.
//  Copyright (c) 2014 Faheem Inayat. All rights reserved.
//

import Foundation

protocol StlParser {

    func readTriangles ( #from: NSURL ) -> ( triangleCount: Int, triangles: [StlTriangle], error: NSError? )

}