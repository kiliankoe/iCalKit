//
//  EscapedTests.swift
//  iCalKit-iOS Tests
//
//  Created by Parthasarathy Gudivada on 1/31/18.
//  Copyright © 2018 iCalKit. All rights reserved.
//

import XCTest
@testable import iCalKit

class EscapedTests: XCTestCase {
    
    var exampleCals: [iCalKit.Calendar] = []

    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "escapedExample", withExtension: "ics") else {
            XCTAssert(false, "no test escaped ics file")
            return
        }
        
        do {
            let encodedCalString = try String(contentsOf: url, encoding: .utf8)
            let unescapedString = RFS5545Escape().unescapedString(encodedCalString)
            exampleCals = iCal.load(string: unescapedString)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadLocalFile() {
        XCTAssertTrue(exampleCals.count > 0, "we should have a calendar entry")
    }
    
    func testValidateEscpaedSummary() {
        
        guard let cal = exampleCals.first else {
            XCTAssert(false, "No Calendar found")
            return
        }
        
        XCTAssertTrue(cal.subComponents.count == 2, "should have two events")
        
        guard let firstEvent = cal.subComponents[0] as? Event else {
            XCTAssert(false, "There should be an event")
            return
        }
        
        let summary = "Bastille , Day ; Party  "
      
        XCTAssertTrue(summary == firstEvent.summary!, "summaries should be equal")
     }
    
    

    
}
