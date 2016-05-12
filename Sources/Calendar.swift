struct Calendar {
    var events = [Event]()

    var otherAttrs = [String:String]()

    init() {

    }

    mutating func appendEvent(event: Event?) {
        if let event = event {
            events.append(event)
        }
    }
}

extension Calendar: CalendarElement {
    mutating func addAttribute(attr: String, _ value: String) {
        switch attr {
        default:
            otherAttrs[attr] = value
        }
    }

    func toICal() -> String {
        var str = "BEGIN:VCALENDAR\n"

        for (key, val) in otherAttrs {
            str += "\(key):\(val)\n"
        }

        for event in events {
            str += "\(event.toICal())\n"
        }

        str += "END:VCALENDAR"
        return str
    }
}
