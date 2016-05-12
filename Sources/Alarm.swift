import Foundation

struct Alarm {
    var subComponents = [CalendarComponent]()
    var otherAttrs = [String:String]()
}

extension Alarm: CalendarComponent {
    mutating func addAttribute(attr: String, _ value: String) {
        switch attr {
            default:
                otherAttrs[attr] = value
        }
    }

    func toICal() -> String {
        var str = "BEGIN:VALARM\n"

        for (key, val) in otherAttrs {
            str += "\(key):\(val)\n"
        }

        str += "END:VALARM"
        return str
    }
}
