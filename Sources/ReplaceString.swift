//
//  ReplaceString.swift
//  iCalKit
//
//  Created by Parthasarathy Gudivada on 1/31/18.
//  Copyright © 2018 iCalKit. All rights reserved.
//

import Foundation

/**
 To represent the character that gets encoded and the corresponding decoded character used in the iCAL standards.
 eg., Comma (",") gets encoded as ( "\," with the backslash ) for the data interchange.
 */
struct SubstituteEscapeString {
    let encoded: String
    let decoded: String
}
