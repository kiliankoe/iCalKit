//
//  ICALEscape.swift
//  iCalKit
//
//  Created by Parthasarathy Gudivada on 1/31/18.
//  Copyright © 2018 iCalKit. All rights reserved.
//

import Foundation

protocol ICALEscape {
    
    var escapeUnescapeArray: [SubstituteEscapeString] {
        get
    }
    
    func unescapedString(_ for: String) ->  String
}

extension ICALEscape {
    
    func unescapedString(_ forTheInput: String) ->  String {
        return  forTheInput.replacingEscapeOccurrences(escapeUnescapeArray)
    }
}

