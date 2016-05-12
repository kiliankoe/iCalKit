protocol CalendarElement {
    var otherAttrs: [String:String] { get set }
    mutating func addAttribute(attr: String, _ value: String)
}
