struct Calendar {
    var subComponents = [CalendarComponent]()
    var otherAttrs = [String:String]()

    init() {

    }
}

extension Calendar: CalendarComponent {
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

        for component in subComponents {
            str += "\(component.toICal())\n"
        }

        str += "END:VCALENDAR"
        return str
    }
}
