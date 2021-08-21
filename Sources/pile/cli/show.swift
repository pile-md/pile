import Foundation
import ArgumentParser

extension CLI {
    struct Show: ParsableCommand {
        static var configuration =
                CommandConfiguration(
                        abstract: "List various properties",
                        subcommands: [Tags.self]
                )

        struct Tags: ParsableCommand {
            static var configuration =
                    CommandConfiguration(abstract: "List all tags")

            func run() throws {
                var tags = Set<String>()
                for block in parsePile() {
                    tags.insert(block.tags)
                }
                for tag in tags {
                    print(tag)
                }

            }
        }
    }
}