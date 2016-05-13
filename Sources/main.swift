import Foundation

let cals = try! iCal.loadFile("example.ics")

for cal in cals {
    print(cal.toICal())
}

// for cal in cals {
//     for event in cal.subComponents where event is Event {
//         print(event)
//     }
// }

// var event = Event() // If no further params are supplied, only `uid` and `dtstamp` are set.
// event.summary = "Awesome event"
// print(event) // 20160513T003222+0200: Awesome event!
//
// let calendar = Calendar(withComponents: [event])
//
// let iCalString = calendar.toICal()
// print(iCalString)
