import Foundation

struct Event {
    // required
    var uid: String!
    var dtstamp: NSDate!

    // optional
    // var organizer: Organizer? = nil
    var location: String?
    var summary: String?
    var descr: String?
    // var class: some enum type?
    var dtstart: NSDate?
    var dtend: NSDate?

    var otherAttrs = [String:String]()

    init(uid: String? = NSUUID().UUIDString, dtstamp: NSDate? = NSDate()) {
        self.uid = uid
        self.dtstamp = dtstamp
    }
}

extension Event: CalendarComponent {
    mutating func addAttribute(attr: String, _ value: String) {
        switch attr {
        case "UID":
            uid = value
        case "DTSTAMP":
            dtstamp = iCal.dateFromString(value)
        case "DTSTART":
            dtstart = iCal.dateFromString(value)
        case "DTEND":
            dtend = iCal.dateFromString(value)
        // case "ORGANIZER":
        //     organizer
        case "SUMMARY":
            summary = value
        case "DESCRIPTION":
            descr = value
        default:
            otherAttrs[attr] = value
        }
    }

    func toICal() -> String {
        var str = "BEGIN:VEVENT\n"

        if let uid = uid {
            str += "UID:\(uid)\n"
        }

        if let dtstamp = dtstamp {
            str += "DTSTAMP:\(iCal.stringFromDate(dtstamp))\n"
        }

        if let summary = summary {
            str += "SUMMARY:\(summary)\n"
        }

        if let descr = descr {
            str += "DESCRIPTION:\(descr)\n"
        }

        if let dtstart = dtstart {
            str += "DTSTART:\(iCal.stringFromDate(dtstart))\n"
        }

        if let dtend = dtend {
            str += "DTEND:\(iCal.stringFromDate(dtend))\n"
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

extension Event: CustomStringConvertible {
    var description: String {
        return "\(iCal.stringFromDate(dtstamp)): \(summary ?? "")"
    }
}
