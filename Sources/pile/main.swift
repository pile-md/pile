print("type, parent, content")
for block in parsePile() {
    print("\(block.type), \(block.parent?.body.truncate(length: 10) ?? "nil"), \(block.body.truncate(length: 30))")
}

//CLI.main()