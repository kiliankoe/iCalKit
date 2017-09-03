import Foundation

extension Date {
    /// Convert String to Date
    func toString() -> String {
        return iCalManager.dateFormatter.string(from: self)
    }
}
