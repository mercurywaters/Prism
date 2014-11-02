//
//  LittleEndianConverter.swift
//  Prism
//
//  Created by Faheem Chaudhary on 11/1/14.
//  Copyright (c) 2014 Faheem Inayat. All rights reserved.
//

import Foundation

struct LittleEndianConverter {
    
    static func convertToBigEndian (
        #srcBuffer: [SignedByte],
        srcLength: Int,
        inout destBuffer: [ShortFixed],
        destOffset: Int,
        destLength: Int
        ) -> Int
    {
        return convertToBigEndian(
            srcBuffer: srcBuffer,
            srcLength: srcLength,
            destBuffer: &destBuffer,
            destOffset: destOffset,
            destLength: destLength,
            mask: 0xFF);
    }
    
    static func convertToBigEndian (
        #srcBuffer: [SignedByte],
        srcLength: Int,
        inout destBuffer: [ShortFixed],
        destOffset: Int,
        destLength: Int,
        mask: ShortFixed
        ) -> Int
    {
        let minLength: Int = min ( ( destLength * 2 ), ( srcLength / 2 ) * 2 );
        
        for ( var i = 0; i < minLength; i += 2 ) {
            var temp = ( ( ShortFixed(srcBuffer [ i ]) & 0xFF) | ( ShortFixed(srcBuffer[ i + 1 ]) << 8 ) ) & mask;
            destBuffer [ (i/2) + destOffset ] = temp;
        }
        
        return minLength;
    }
    
    static func convertToBigEndian (
        #srcBuffer: [SignedByte],
        inout destBuffer: [Int],
        srcLength: Int,
        destOffset: Int,
        destLength: Int
        ) -> Int
    {
        return convertToBigEndian(
            srcBuffer: srcBuffer,
            destBuffer: &destBuffer,
            srcLength: srcLength,
            destOffset: destOffset,
            destLength: destLength,
            mask: 0xFFFFFFFF );
    }
    
    static func convertToBigEndian (
        #srcBuffer: [SignedByte],
        inout destBuffer: [Int],
        srcLength: Int,
        destOffset: Int,
        destLength: Int,
        mask: Int
        ) -> Int
    {
        let minLength: Int = min ( ( destLength * 4 ), ( ( srcLength / 4 ) * 4 ) );
        
        for ( var i = 0; i < minLength; i += 4 ) {
            
            var firstPart = Int(srcBuffer[ i ]) & 0xFF;
            var secondPart = ( Int(srcBuffer[ i + 1 ]) << 8 ) & 0xFF00;
            var thirdPart = ( Int(srcBuffer[ i + 2 ]) << 16 ) & 0xFF0000;
            var fourthPart = ( Int(srcBuffer[ i + 3 ]) << 24 );

            destBuffer[ (i/4) + destOffset ] = ( firstPart | secondPart | thirdPart | fourthPart ) & mask;
        }
        return minLength;
    }
    
    static func convertToBigEndian (
        #blockSize: Int,
        srcBuffer: [SignedByte],
        inout destBuffer: [Int],
        srcLength: Int,
        destOffset: Int,
        destLength: Int
        ) -> Int
    {
        return convertToBigEndian(
            blockSize: blockSize,
            srcBuffer: srcBuffer,
            destBuffer: &destBuffer,
            srcLength: srcLength,
            destOffset: destOffset,
            destLength: destLength,
            mask: 0xFFFFFFFF );
    }
    
    static func convertToBigEndian (
        #blockSize: Int,
        srcBuffer: [SignedByte],
        inout destBuffer: [Int],
        srcLength: Int,
        destOffset: Int,
        destLength: Int,
        mask: Int
        ) -> Int
    {
        var returnValue: Int = 0;
        
        let minLength = min ( ( destLength * blockSize ), ( ( srcLength / blockSize) * blockSize ) );
        
        switch ( blockSize ) {
        
        case 2:
            for ( var i = 0; i < minLength; i += 2 ) {
                var temp = ( Int(srcBuffer [ i ]) & 0xFF | ( Int(srcBuffer [ i+1 ]) << 8 ) ) & mask;
                destBuffer [ (i/2) + destOffset ] = temp;
            }
            returnValue = minLength;
            break;

        case 3:
            for ( var i = 0; i < minLength; i += 3 ) {
                var temp = (
                      ( Int(srcBuffer [ i ]) & 0xFF )
                    | ( Int(srcBuffer[ i + 1 ]) << 8 ) & 0xFF00
                    | ( Int(srcBuffer[ i + 2 ]) << 24 )
                ) & mask;
            }
            returnValue = minLength;
            break;
        
        case 4:
            returnValue = convertToBigEndian (
                srcBuffer: srcBuffer,
                destBuffer: &destBuffer,
                srcLength: srcLength,
                destOffset: destOffset,
                destLength: destLength,
                mask: mask );
            break;
        
        default:
            returnValue = 0;
        }
        
        return returnValue;
    }
}