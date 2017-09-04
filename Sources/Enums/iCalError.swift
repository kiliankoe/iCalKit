import Foundation

public enum iCalError: Error {
    case fileNotFound
    case encoding
    case parseError
    case unsupportedICalVersion
}
