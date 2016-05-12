extension String {
    func toKeyValuePair(splittingOn separator: Character) -> (first: String, second: String) {
        let arr = self.characters.split(separator, maxSplit: 1).map(String.init)
        return (arr[0], arr[1])
    }
}
