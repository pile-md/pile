import Foundation

func runQuery(_ query: String) -> [String] {
    do {
        let tag = try extractTag(query)
        return parsePile().filter {
            $0.tags.contains(tag)
        }.map {
            $0.fullBody
        }
    } catch {
        print(error)
        return []
    }
}

// Inspired by https://whatdidilearn.info/2018/07/29/how-to-capture-regex-group-values-in-swift.html
func extractTag(_ query: String) throws -> String {

    let pattern = #"SELECT WHERE hasTag\('(?<tag>\w+)'\)"#
    let regex = try? NSRegularExpression(pattern: pattern)

    if let match = regex?.firstMatch(in: query, options: [], range: NSRange(location: 0, length: query.count)) {
        if let tagRange = Range(match.range(withName: "tag"), in: query) {
            return String(query[tagRange])
        }
    }
    throw QueryError.tagNotFound
}

enum QueryError: Error {
    case tagNotFound
}