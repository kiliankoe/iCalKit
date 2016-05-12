protocol CalendarComponent {
    var subComponents: [CalendarComponent] { get set }
    var otherAttrs: [String:String] { get set }

    mutating func addAttribute(attr: String, _ value: String)
    mutating func append(component: CalendarComponent?)

    func toICal() -> String
}

extension CalendarComponent {
    mutating func append(component: CalendarComponent?) {
        if let component = component {
            subComponents.append(component)
        }
    }
}
