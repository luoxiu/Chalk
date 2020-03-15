import XCTest
@testable import Chalk

final class ChalkTests: XCTestCase {
    func testChalk() {
        XCTAssert(Chalk.underline.on("foo") == "\u{001B}[4mfoo\u{001B}[24m")
        XCTAssert(Chalk.red.on("foo") == "\u{001B}[31mfoo\u{001B}[39m");
        XCTAssert(Chalk.bgRed.on("foo") == "\u{001B}[41mfoo\u{001B}[49m");

        XCTAssert(Chalk.red.bgGreen.underline.on("foo") == "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m")
        XCTAssert(Chalk.underline.red.bgGreen.on("foo") == "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m");

        XCTAssert(ck.red.on("foo", ck.underline.bgBlue.on("bar"), "!") == "\u{001B}[31mfoo\u{001B}[4m\u{001B}[44mbar\u{001B}[24m\u{001B}[49m!\u{001B}[39m")

        let nest = ck.red.on("a" + ck.yellow.on("b" + ck.green.on("c") + "b") + "c")
        XCTAssert(nest.terminalDescription == "\u{001B}[31ma\u{001B}[33mb\u{001B}[32mc\u{001B}[33mb\u{001B}[31mc\u{001B}[39m")
    }

    static var allTests = [
        ("testChalk", testChalk),
    ]
}
