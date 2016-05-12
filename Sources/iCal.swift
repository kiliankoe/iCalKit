import Foundation

class iCal {
    static func dateFromString(string: String) -> NSDate? {
        return iCal.dateFormatter.dateFromString(string)
    }

    static func stringFromDate(date: NSDate) -> String {
        return iCal.dateFormatter.stringFromDate(date)
    }

    static let dateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        // TODO: This isn't quite correct. It works for parsing, but not for stringifying a date
        // output `should be 20160512T225845Z, but is 20160512T225845+0200
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmssZ"
        return dateFormatter
    }()
}
