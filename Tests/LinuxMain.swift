import XCTest

import pileTests

var tests = [XCTestCaseEntry]()
tests += pileTests.allTests()
XCTMain(tests)
