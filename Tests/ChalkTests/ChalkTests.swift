import XCTest
@testable import Chalk

final class ChalkTests: XCTestCase {
    func testChalk() {
        __global_supported_color__ = .ansi16m
        
        XCTAssertEqual(chalk.underline.on("foo"), "\u{001B}[4mfoo\u{001B}[24m")
        XCTAssertEqual(chalk.red.on("foo"), "\u{001B}[31mfoo\u{001B}[39m")
        XCTAssertEqual(chalk.bgRed.on("foo"), "\u{001B}[41mfoo\u{001B}[49m")

        XCTAssertEqual(chalk.red.bgGreen.underline.on("foo"), "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m")
        XCTAssertEqual(chalk.underline.red.bgGreen.on("foo"), "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m")

        let nest = ck.red.on("a" + ck.yellow.on("b" + ck.green.on("c") + "b") + "c")
        XCTAssertEqual(nest, "\u{001B}[31ma\u{001B}[33mb\u{001B}[32mc\u{001B}[33mb\u{001B}[31mc\u{001B}[39m")
    }

    static var allTests = [
        ("testChalk", testChalk),
    ]
}
