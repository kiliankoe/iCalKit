import Foundation

/// TODO add documentation
public struct Alarm {
    public var subComponents: [CalendarComponent] = []
    public var otherAttrs = [String:String]()
} // End struct

extension Alarm: IcsElement {
    public mutating func addAttribute(attr: String, _ value: String) {
        switch attr { // TODO switch not needed, it'll always be default
            default:
                otherAttrs[attr] = value
        }
    }
} // End extension

extension Alarm: CalendarComponent {
    public func toCal() -> String {
        var str = "BEGIN:VALARM\n"

        for (key, val) in otherAttrs {
            str += "\(key):\(val)\n"
        }

        str += "END:VALARM"
        return str
    }
} // End extensuon
