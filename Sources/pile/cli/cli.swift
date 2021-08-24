import Foundation
import ArgumentParser

struct CLI: ParsableCommand {
    static var configuration = CommandConfiguration(
            commandName: "pile",
            // Optional abstracts and discussions are used for help output.
            abstract: "A knowledgebase management tool",
            // Commands can define a version for automatic '--version' support.
            version: "0.1",
            subcommands: [Show.self, Query.self]
    )
}
