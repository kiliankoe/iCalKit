public protocol IcsElement {
    var subComponents: [IcsElement] { get set }
    var otherAttrs: [String:String] { get set }

    mutating func addAttribute(attr: String, _ value: String)
    mutating func append(component: IcsElement?)

    func toCal() -> String
}

extension IcsElement {
    public mutating func append(component: IcsElement?) {
        if let component = component {
            subComponents.append(component)
        }
    }
}
