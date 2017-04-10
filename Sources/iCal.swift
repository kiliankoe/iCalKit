import Foundation

public class iCal {

    public static func loadFile(path: String) throws -> [Calendar] {
        guard
            let path = URL(string: path),
            let data = try? Data(contentsOf: path),
            let string = String(data: data, encoding: .utf8)
        else {
            throw iCalError.fileNotFound
        }

        let icsContent = string.splitNewlines()

        return parse(icsContent)
    }

    public static func loadString(string: String) -> [Calendar] {
        let icsContent = string.splitNewlines()

        return parse(icsContent)
    }

    public static func loadURL(url: URL) throws -> [Calendar] {
        guard let data = try? Data(contentsOf: url) else { throw iCalError.fileNotFound }
        guard let string = String(data: data, encoding: .utf8) else { throw iCalError.encoding }

        let icsContent = string.splitNewlines()

        return parse(icsContent)
    }

    private static func parse(_ icsContent: [String]) -> [Calendar] {
        let parser = Parser(icsContent)
        do {
            return try parser.read()
        } catch let error {
            print(error)
            return []
        }
    }

    // Convenience and Util functions

    public static func date(from string: String) -> Date? {
        return iCal.dateFormatter.date(from: string)
    }

    public static func string(from date: Date) -> String {
        return iCal.dateFormatter.string(from: date)
    }

    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        return dateFormatter
    }()
}
