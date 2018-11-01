import XCTest
@testable import Crayon

final class CrayonTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Crayon().text, "Hello, World!")

        print(Calendar.current.timeZone)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
