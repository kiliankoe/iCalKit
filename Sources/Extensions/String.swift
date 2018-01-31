import Foundation

extension String {
    /// TODO add documentation
    func toKeyValuePair(splittingOn separator: Character) -> (first: String, second: String)? {
        let arr = self.split(separator: separator,
                                        maxSplits: 1,
                                        omittingEmptySubsequences: false)
        if arr.count < 2 {
            return nil
        } else {
            return (String(arr[0]), String(arr[1]))
        }
    }

    /// Convert String to Date
    func toDate() -> Date? {
        return iCal.dateFormatter.date(from: self)
    }
}

extension String {
    
    func replacingEscapeOccurrences(_ using: [SubstituteEscapeString])  -> String {
        
        var updatedString = self
        
        using.forEach {
            updatedString = updatedString.replacingOccurrences(of: $0.encoded,
                                                               with: $0.decoded,
                                                               options: .caseInsensitive)
        }
        
        return updatedString
    }
}

