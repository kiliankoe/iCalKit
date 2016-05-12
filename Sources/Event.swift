import Foundation

struct Event {
    // required
    var uid: String!
    var stamp: NSDate!

    // optional
    // var organizer: Organizer? = nil
    var location: String?
    var summary: String?
    var description: String?// probably shouldn't call this description
    // var class: some enum type?
    var start: NSDate?
    var end: NSDate?

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

    func toICal() -> String {
        var str = "BEGIN:VEVENT\n"
        str += "UID:\(uid)\n"
        str += "DTSTAMP:\(iCal.stringFromDate(stamp))\n"

        if let summary = summary {
            str += "SUMMARY:\(summary)\n"
        }

        if let description = description {
            str += "DESCRIPTION:\(description)\n"
        }

        if let start = start {
            str += "DTSTART:\(iCal.stringFromDate(start))\n"
        }

        if let end = end {
            str += "DTEND:\(iCal.stringFromDate(end))\n"
        }

        for (key, val) in otherAttrs {
            str += "\(key):\(val)\n"
        }

        str += "END:VEVENT"
        return str
    }
}

extension Event: Equatable {}

func ==(lhs: Event, rhs: Event) -> Bool {
    return lhs.uid == rhs.uid
}
