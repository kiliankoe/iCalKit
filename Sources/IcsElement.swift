public protocol IcsElement {
    var subComponents: [CalendarComponent] { get set }
    var otherAttrs: [String:String] { get set }

    mutating func addAttribute(attr: String, _ value: String)
    mutating func append(component: IcsElement?)

    func toCal() -> String
}

extension IcsElement {
    public mutating func append(component: CalendarComponent?) {
        if let component = component {
            subComponents.append(component)
        }
    }
}
