import XCTest
@testable import Crayon

final class CrayonTests: XCTestCase {
    func testCrayon() {
        XCTAssert(crayon.underline.on("foo") == "\u{001B}[4mfoo\u{001B}[24m")
        XCTAssert(crayon.red.on("foo") == "\u{001B}[31mfoo\u{001B}[39m");
        XCTAssert(crayon.bgRed.on("foo") == "\u{001B}[41mfoo\u{001B}[49m");

        XCTAssert(crayon.red.bgGreen.underline.on("foo") == "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m")
        XCTAssert(crayon.underline.red.bgGreen.on("foo") == "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m");

        XCTAssert(cy.red.on("foo", cy.underline.bgBlue.on("bar"), "!") == "\u{001B}[31mfoo\u{001B}[4m\u{001B}[44mbar\u{001B}[24m\u{001B}[49m!\u{001B}[39m")

        let nest = cy.red.on("a" + cy.yellow.on("b" + cy.green.on("c") + "b") + "c")
        XCTAssert(nest.rendered == "\u{001B}[31ma\u{001B}[33mb\u{001B}[32mc\u{001B}[33mb\u{001B}[31mc\u{001B}[39m")
    }

    static var allTests = [
        ("testCrayon", testCrayon),
    ]
}
