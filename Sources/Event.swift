import Foundation

/// TODO add documentation
public struct Event {
    public var subComponents: [CalendarComponent] = []
    public var otherAttrs = [String:String]()

    // required
    public var uid: String!
    public var dtstamp: Date!

    // optional
    // public var organizer: Organizer? = nil
    public var location: String?
    public var summary: String?
    public var descr: String?
    // public var class: some enum type?
    public var dtstart: Date?
    public var dtend: Date?

    public init(uid: String? = NSUUID().uuidString, dtstamp: Date? = Date()) {
        self.uid = uid
        self.dtstamp = dtstamp
    }
} // End struct

extension Event: CalendarComponent {
    public func toCal() -> String {
        var str: String = "BEGIN:VEVENT\n"

        guard let uid = uid,
              let dtstamp = dtstamp,
              let summary = summary,
              let descr = descr,
              let dtstart = dtstart,
              let dtend = dtend
            else {
            str += "END:VEVENT"
            return str
        }
        
        str += "UID:\(uid)\n"
        str += "DTSTAMP:\(iCal.string(from: dtstamp))\n"
        str += "SUMMARY:\(summary)\n"
        str += "DESCRIPTION:\(descr)\n"
        str += "DTSTART:\(iCal.string(from: dtstart))\n"
        str += "DTEND:\(iCal.string(from: dtend))\n"

        for (key, val) in otherAttrs {
            str += "\(key):\(val)\n"
        }

        for component in subComponents {
            str += "\(component.toCal())\n"
        }

        str += "END:VEVENT"
        return str
    }
} // End extension

extension Event: IcsElement {
    public mutating func addAttribute(attr: String, _ value: String) {
        switch attr {
        case "UID":
            uid = value
        case "DTSTAMP":
            dtstamp = iCal.date(from: value)
        case "DTSTART":
            dtstart = iCal.date(from: value)
        case "DTEND":
            dtend = iCal.date(from: value)
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
} // End extension

extension Event: Equatable { }

public func ==(lhs: Event, rhs: Event) -> Bool {
    return lhs.uid == rhs.uid
}

extension Event: CustomStringConvertible {
    public var description: String {
        return "\(iCal.string(from: dtstamp)): \(summary ?? "")"
    }
} // End extension
