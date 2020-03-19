import XCTest
@testable import Chalk

final class ChalkTests: XCTestCase {
    func testChalk() {
        __preset_supported_color__ = .ansi16m
        
        XCTAssertEqual(chalk.underline.on("foo").description, "\u{001B}[4mfoo\u{001B}[24m".description)
        XCTAssertEqual(chalk.red.on("foo").description, "\u{001B}[31mfoo\u{001B}[39m".description)
        XCTAssertEqual(chalk.bgRed.on("foo").description, "\u{001B}[41mfoo\u{001B}[49m".description)

        XCTAssertEqual(chalk.red.bgGreen.underline.on("foo").description, "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m")
        XCTAssertEqual(chalk.underline.red.bgGreen.on("foo").description, "\u{001B}[4m\u{001B}[31m\u{001B}[42mfoo\u{001B}[24m\u{001B}[39m\u{001B}[49m")

        let nest = ck.red.on("a" + ck.yellow.on("b" + ck.green.on("c") + "b") + "c")
        XCTAssertEqual(nest.description, "\u{001B}[31ma\u{001B}[39m\u{001B}[33mb\u{001B}[39m\u{001B}[32mc\u{001B}[39m\u{001B}[33mb\u{001B}[39m\u{001B}[31mc\u{001B}[39m")
    }

    static var allTests = [
        ("testChalk", testChalk),
    ]
}
