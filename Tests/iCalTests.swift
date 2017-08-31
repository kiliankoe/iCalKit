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
        guard let cal = exampleCals.first
            else {
                XCTAssert(false, "No calendar found")
                return
        }

        var firstEvent: Event = Event()
        firstEvent.uid = "uid1@example.com"
        firstEvent.dtstamp = iCal.date(from: "19970714T170000Z")
        firstEvent.summary = "Bastille Day Party"
        firstEvent.dtstart = iCal.date(from: "19970714T170000Z")
        firstEvent.dtend = iCal.date(from: "19970715T035959Z")
        // TODO add alarm to `firstEvent`

        var secondEvent: Event = Event()
        secondEvent.uid = "uid2@example.com"
        secondEvent.dtstamp = iCal.date(from: "19980714T170000Z")
        secondEvent.summary = "Something completely different"
        secondEvent.dtstart = iCal.date(from: "19980714T170000Z")
        secondEvent.dtend = iCal.date(from: "19980715T035959Z")
        // TODO add organizer to `secondEvent`

        XCTAssertEqual(cal.subComponents.count, 2) // Should have 2 events
        XCTAssertEqual(cal.subComponents[0] as! Event, firstEvent)
        XCTAssertEqual(cal.subComponents[1] as! Event, secondEvent)
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

