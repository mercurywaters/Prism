//
//  StlParser.swift
//  Prism
//


import Foundation

protocol StlParser {

    func readTriangles ( #from: NSURL ) -> ( triangleCount: Int, triangles: [StlTriangle], error: NSError? )

}