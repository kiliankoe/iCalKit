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
}
