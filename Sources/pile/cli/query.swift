import Foundation
import ArgumentParser

extension CLI {
    struct Query: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Execute a query")
        @Argument var query: String

        func run() throws {
            var isFirst = true
            for block in runQuery(query) {
                if !isFirst {
                    print("====")
                }
                isFirst = false
                print(block)
            }

        }
    }
}
