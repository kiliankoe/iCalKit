//
//  RFS5545Escape.swift
//  iCalKit
//
//  Created by Parthasarathy Gudivada on 1/31/18.
//  Copyright © 2018 iCalKit. All rights reserved.
//

import Foundation




struct RFS5545Escape: ICALEscape {
    
    let replaceComma = SubstituteEscapeString(encoded: .escapedComma,
                                              decoded: .unEscapedComma)
    let replaceSemicolon = SubstituteEscapeString(encoded: .escapedSemicolon,
                                                  decoded: .unEscapedSemicolon)
    let replaceNewline = SubstituteEscapeString(encoded: .escapedNewline,
                                                decoded: .unEscapedNewline)
//    let replaceBackslash = SubstituteEscapeString(encoded: .escapedBackslash,
//                                                  decoded: .unEscapedBackslash)
    
    var escapeUnescapeArray: [SubstituteEscapeString] {
        
        return [replaceComma,
                replaceNewline,
                replaceSemicolon]
    }
    
}

