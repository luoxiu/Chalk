import XCTest
@testable import Crayon

final class CrayonTests: XCTestCase {
    func testCrayon() {
        XCTAssertEqual(crayon.underline.on("foo").raw, "\u{001B}[4mfoo\u{001B}[24m")
        XCTAssertEqual(crayon.red.on("foo").raw, "\u{001B}[31mfoo\u{001B}[39m");
        XCTAssertEqual(crayon.bgRed.on("foo").raw, "\u{001B}[41mfoo\u{001B}[49m");

        XCTAssertEqual(crayon.red.bgGreen.underline.on("foo").raw, "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m")
        XCTAssertEqual(crayon.underline.red.bgGreen.on("foo").raw, "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m");

        XCTAssertEqual(cy.red.on("foo", cy.underline.bgBlue.on("bar"), "!").raw, "\u{001B}[31mfoo\u{001B}[4m\u{001B}[44mbar\u{001B}[24m\u{001B}[49m!\u{001B}[39m")

        let nest = cy.red.on("a" + cy.yellow.on("b" + cy.green.on("c") + "b") + "c")
        XCTAssertEqual(nest.raw, "\u{001B}[31ma\u{001B}[33mb\u{001B}[32mc\u{001B}[39mb\u{001B}[39mc\u{001B}[39m")
    }

    static var allTests = [
        ("testCrayon", testCrayon),
    ]
}
