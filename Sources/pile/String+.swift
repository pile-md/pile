import Foundation

extension String {
    // https://stackoverflow.com/a/45166886/9035706
    func matches(_ regex: String) -> Bool {
        self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    func isSequenceOf(_ char: Character) -> Bool {
        for c in self {
            if c != char {
                return false
            }
        }
        return true
    }
}
