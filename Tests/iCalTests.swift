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
    static var allTests = [
        ("testLoadLocalFile", testLoadLocalFile),
        ("testEventData", testEventData),
        ("testiCalString", testiCalString),
        ("testQuickstart", testQuickstart),
        ("testQuickstartFromUrl", testQuickstartFromUrl),
    ]

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
        let cal = exampleCals.first!
        for event in cal.subComponents where event is Event {
            XCTAssertEqual(event.toCal(), "") // TODO
        }
    }

    func testiCalString() {
        var event = Event()
        event.summary = "Awesome Event"
        let cal = CCalendar(withComponents: [event])
        XCTAssertEqual(cal.toCal(), "") // TODO
    }

    func testQuickstart() {
        var event = Event()
        event.summary = "Awesome event"
        let calendar = CCalendar(withComponents: [event])
        let iCalString = calendar.toCal()

        XCTAssertEqual(iCalString.contains("SUMMARY:Awesome event"), true)
    }

    func testQuickstartFromUrl() {
        let url = URL(string: "https://raw.githubusercontent.com/kiliankoe/iCal/master/example.ics")!
        let cals = try! iCal.load(url: url)
        // or loadFile() or loadString(), all of which return [Calendar] as an ics file can contain multiple calendars

        for cal in cals {
            for event in cal.subComponents where event is Event {
                print(event)
            }
        }
        XCTAssertEqual(cals[0].subComponents.count, 2) // Should have 2 events
        XCTAssertEqual("\(cals[0].subComponents[0])", "19970714T170000Z: Bastille Day Party")
        XCTAssertEqual("\(cals[0].subComponents[1])", "19980714T170000Z: Something completely different")
    }
} // End class

