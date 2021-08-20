import Foundation

extension String {
    // https://stackoverflow.com/a/45166886/9035706
    func matches(_ regex: String) -> Bool {
        self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
