import Foundation

struct Event {
    // required
    var uid: String!
    var stamp: NSDate!

    // optional
    // var organizer: Organizer? = nil
    var location: String? = nil
    var summary: String? = nil
    var description: String? = nil // probably shouldn't call this description
    // var class: some enum type?
    var start: NSDate? = nil
    var end: NSDate? = nil

    var otherAttrs = [String:String]()

    init() {

    }
}

extension Event: CalendarElement {
    mutating func addAttribute(attr: String, _ value: String) {
        switch attr {
        case "UID":
            uid = value
        case "DTSTAMP":
            stamp = iCal.dateFromString(value)
        case "DTSTART":
            start = iCal.dateFromString(value)
        case "DTEND":
            end = iCal.dateFromString(value)
        // case "ORGANIZER":
        //     organizer
        case "SUMMARY":
            summary = value
        case "DESCRIPTION":
            description = value
        default:
            otherAttrs[attr] = value
        }
    }
}

extension Event: Equatable {}

func ==(lhs: Event, rhs: Event) -> Bool {
    return lhs.uid == rhs.uid
}
