//
//  TerminalString.swift
//  Chalk
//
//  Created by Quentin Jin on 2018/10/19.
//

import Foundation

public let chalk = Style()
public let ck = Style()

public struct Style {
    public var fgColor: TerminalColor?

    public var bgColor: TerminalColor?

    public var modifiers: Set<Modifier>?

    public init(fgColor: TerminalColor? = nil,
                bgColor: TerminalColor? = nil,
                modifiers: Set<Modifier>? = nil)
    {
        self.fgColor = fgColor
        self.bgColor = bgColor
        self.modifiers = modifiers
    }
}

public extension Style {
    func on(_ other: Style) -> Style {
        var style = self
        style.fgColor = other.fgColor ?? style.fgColor
        style.bgColor = other.bgColor ?? style.bgColor
        if style.modifiers == nil {
            style.modifiers = other.modifiers
        } else {
            style.modifiers?.formUnion(other.modifiers ?? [])
        }
        return style
    }

    func on(_ terminalStringConvertibles: TerminalStringConvertible...) -> TerminalString {
        let strings = terminalStringConvertibles
            .flatMap {
                $0.terminalString
                    .strings
                    .map {
                        ($0.0, on($0.1))
                    }
            }
        return TerminalString(strings: strings)
    }
}

public extension Style {
    func modify(_ modifier: Modifier) -> Style {
        var style = self
        if style.modifiers == nil {
            style.modifiers = [modifier]
        } else {
            style.modifiers!.insert(modifier)
        }
        return style
    }

    var reset: Style {
        modify(.reset)
    }

    var bold: Style {
        modify(.bold)
    }

    var faint: Style {
        modify(.faint)
    }

    var dim: Style { // faint
        faint
    }

    var italic: Style {
        modify(.italic)
    }

    var underline: Style {
        modify(.underline)
    }

    var blink: Style {
        modify(.blink)
    }

    var reverse: Style {
        modify(.reverse)
    }

    var conceal: Style {
        modify(.conceal)
    }

    var hidden: Style { // conceal
        conceal
    }

    var crossedOut: Style {
        modify(.crossedOut)
    }

    var strikethrough: Style { // crossedOut
        crossedOut
    }
}

public extension Style {
    func fg(ansi16: ANSI16Color) -> Style {
        var style = self
        style.fgColor = ansi16
        return style
    }

    func bg(ansi16: ANSI16Color) -> Style {
        var style = self
        style.bgColor = ansi16
        return style
    }

    var black: Style {
        fg(ansi16: .black)
    }

    var red: Style {
        fg(ansi16: .red)
    }

    var green: Style {
        fg(ansi16: .green)
    }

    var yellow: Style {
        fg(ansi16: .yellow)
    }

    var blue: Style {
        fg(ansi16: .blue)
    }

    var magenta: Style {
        fg(ansi16: .magenta)
    }

    var cyan: Style {
        fg(ansi16: .cyan)
    }

    var white: Style {
        fg(ansi16: .white)
    }

    var blackBright: Style {
        fg(ansi16: .blackBright)
    }

    var redBright: Style {
        fg(ansi16: .redBright)
    }

    var greenBright: Style {
        fg(ansi16: .greenBright)
    }

    var yellowBright: Style {
        fg(ansi16: .yellowBright)
    }

    var blueBright: Style {
        fg(ansi16: .blueBright)
    }

    var magentaBright: Style {
        fg(ansi16: .magentaBright)
    }

    var cyanBright: Style {
        fg(ansi16: .cyanBright)
    }

    var whiteBright: Style {
        fg(ansi16: .whiteBright)
    }

    var gray: Style {
        blackBright
    }

    var bgBlack: Style {
        bg(ansi16: .black)
    }

    var bgRed: Style {
        bg(ansi16: .red)
    }

    var bgGreen: Style {
        bg(ansi16: .green)
    }

    var bgYellow: Style {
        bg(ansi16: .yellow)
    }

    var bgBlue: Style {
        bg(ansi16: .blue)
    }

    var bgMagenta: Style {
        bg(ansi16: .magenta)
    }

    var bgCyan: Style {
        bg(ansi16: .cyan)
    }

    var bgWhite: Style {
        bg(ansi16: .white)
    }

    var bgBlackBright: Style {
        bg(ansi16: .blackBright)
    }

    var bgRedBright: Style {
        bg(ansi16: .redBright)
    }

    var bgGreenBright: Style {
        bg(ansi16: .greenBright)
    }

    var bgYellowBright: Style {
        bg(ansi16: .yellowBright)
    }

    var bgBlueBright: Style {
        bg(ansi16: .blueBright)
    }

    var bgMagentaBright: Style {
        bg(ansi16: .magentaBright)
    }

    var bgCyanBright: Style {
        bg(ansi16: .cyanBright)
    }

    var bgWhiteBright: Style {
        bg(ansi16: .whiteBright)
    }

    var bgGray: Style {
        bgBlackBright
    }
}

public extension Style {
    func fg(_ color: RainbowColor) -> Style {
        var style = self
        style.fgColor = color
        return style
    }

    func bg(_ color: RainbowColor) -> Style {
        var style = self
        style.bgColor = color
        return style
    }

    func fg(_ color: ANSI16Color) -> Style {
        var style = self
        style.fgColor = color
        return style
    }

    func bg(_ color: ANSI16Color) -> Style {
        var style = self
        style.bgColor = color
        return style
    }
}
