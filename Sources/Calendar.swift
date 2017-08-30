import Foundation

public struct CCalendar {
    public var subComponents: [CalendarComponent] = []
    public var otherAttrs = [String:String]()

    public init(withComponents components: [CalendarComponent]?) {
        if let components = components {
            self.subComponents = components
        }
    }
} // End struct

extension CCalendar: IcsElement {

    public mutating func append(component: CalendarComponent?) {
        guard let component = component else {
            return
        }
        self.subComponents.append(component)
    }

    public mutating func addAttribute(attr: String, _ value: String) {
        switch attr { // TODO switch not needed, it'll always be default
        default:
            otherAttrs[attr] = value
        }
    }

} // End extension

extension CCalendar: CalendarComponent {
    public func toCal() -> String {
        var str = "BEGIN:VCALENDAR\n"

        for (key, val) in otherAttrs {
            str += "\(key):\(val)\n"
        }

        for component in subComponents {
            str += "\(component.toCal())\n"
        }

        str += "END:VCALENDAR"
        return str
    }
} // End extension
