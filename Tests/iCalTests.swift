//
//  iCalTests.swift
//  iCal
//
//  Created by Kilian Koeltzsch on {TODAY}.
//  Copyright © 2017 iCal. All rights reserved.
//

import XCTest
@testable import iCal

class iCalTests: XCTestCase {
    var exampleCals: [CCalendar] = []

    override func setUp() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "example", withExtension: "ics") else {
            XCTAssert(false, "no test ics file")
            return
        }
        
        do {
            self.exampleCals = try iCal.load(url: url)
        } catch {
            print(error.localizedDescription)
        }
    }

    func testLoadLocalFile() {
        XCTAssert(exampleCals.count > 0)
    }

    func testEventData() {
//        let cal = exampleCals.first!
//        for event in cal.subComponents where event is Event {
//            XCTAssertEqual(event, "") // TODO
//        }
    }

    func testiCalString() {
//        var event = Event()
//        event.summary = "Awesome Event"
//        let cal = Calendar(withComponents: [event])
//        XCTAssertEqual(cal.asIcal, "") // TODO
    }

    static var allTests = [
        ("testLoadLocalFile", testLoadLocalFile),
        ("testEventData", testEventData),
        ("testiCalString", testiCalString),
    ]
} // End class

