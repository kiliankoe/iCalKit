import Foundation

class iCal {
    static func dateFromString(string: String) -> NSDate? {
        return iCal.dateFormatter.dateFromString(string)
    }

    static let dateFormatter: NSDateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmssZ"
        return dateFormatter
    }()
}
