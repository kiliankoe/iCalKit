//
//  iCalTests.swift
//  iCal
//
//  Created by Kilian Koeltzsch on {TODAY}.
//  Copyright © 2017 iCal. All rights reserved.
//

import Foundation
import XCTest
import iCal

class iCalTests: XCTestCase {
    var exampleCals: [Calendar]?

    override func setUp() {
        let example = Bundle.main.path(forResource: "example", ofType: "ics")!
        let url = URL(string: example)!

        self.exampleCals = try! iCal.load(url: url)
    }

    func testLoadLocalFile() {
        XCTAssert(exampleCals.count > 0)
    }

    func testEventData() {
        let cal = exampleCals?.first!
        for event in cal.components where event is Event {
            XCTAssertEqual(event, "") // TODO
        }
    }

    func testiCalString() {
        var event = Event()
        event.summary = "Awesome Event"
        let cal = Calendar(withComponents: [event])
        XCTAssertEqual(cal.asIcal, "") // TODO
    }

    static var allTests = [
        ("testLoadLocalFile", testLoadLocalFile),
        ("testEventData", testEventData),
        ("testiCalString", testiCalString),
    ]
}
