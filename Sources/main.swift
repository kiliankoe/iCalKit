let parser = try! Parser(path: "example.ics")

var cals: [Calendar]? = nil

do {
    cals = try parser.read()
} catch let error {
    print(error)

}

if let cals = cals {
    print(cals)
}
