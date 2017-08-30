import Foundation

extension String {
    /// TODO add documentation
    func toKeyValuePair(splittingOn separator: Character) -> (first: String, second: String) {
        let arr = self.characters.split(separator: separator,
                                        maxSplits: 1,
                                        omittingEmptySubsequences: false).map(String.init)
        return (arr[0], arr[1])
    }
} // End extension
