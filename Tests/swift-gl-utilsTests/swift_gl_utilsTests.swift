import XCTest
@testable import swift_gl_utils

final class swift_gl_utilsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_gl_utils().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
