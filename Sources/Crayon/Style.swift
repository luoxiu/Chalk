//
//  TerminalString.swift
//  Crayon
//
//  Created by Quentin MED on 2018/10/19.
//

import Foundation

public let crayon = Style()
public let cy = Style()

public struct Style {

    public var fg: TerminalColor?

    public var bg: TerminalColor?

    public var modifiers: Set<Modifier>?
}

extension Style {
    
    public func on(_ s: String) -> TerminalString {
        return TerminalString(s: s, style: self)
    }
}

extension Style {

    public func fg(_ color: RainbowColor) -> Style {
        var style = self
        style.fg = color
        return style
    }

    public func bg(_ color: RainbowColor) -> Style {
        var style = self
        style.bg = color
        return style
    }
}

extension Style {

    private func modify(_ modifier: Modifier) -> Style {
        var style = self
        if style.modifiers == nil {
            style.modifiers = []
        }
        style.modifiers?.insert(modifier)
        return style
    }
    
    public var reset: Style {
        return modify(.reset)
    }
    
    public var bold: Style {
        return modify(.bold)
    }
    
    public var faint: Style {
        return modify(.faint)
    }
    
    public var dim: Style {                 // faint
        return faint
    }
    
    public var italic: Style {
        return modify(.italic)
    }
    
    public var underline: Style {
        return modify(.underline)
    }
    
    public var reverse: Style {
        return modify(.reverse)
    }
    
    public var conceal: Style {
        return modify(.conceal)
    }
    
    public var hidden: Style {              // conceal
        return conceal
    }
    
    public var crossedOut: Style {
        return modify(.crossedOut)
    }
    
    public var strikethrough: Style {       // crossedOut
        return crossedOut
    }
}

extension Style {

    private func fg(basic: BasicColor) -> Style {
        var style = self
        style.fg = basic
        return style
    }

    private func bg(basic: BasicColor) -> Style {
        var style = self
        style.bg = basic
        return style
    }
    
    public var black: Style {
        return fg(basic: .black)
    }
    
    public var red: Style {
        return fg(basic: .red)
    }
    
    public var green: Style {
        return fg(basic: .green)
    }
    
    public var yellow: Style {
        return fg(basic: .yellow)
    }
    
    public var blue: Style {
        return fg(basic: .blue)
    }
    
    public var magenta: Style {
        return fg(basic: .magenta)
    }
    
    public var cyan: Style {
        return fg(basic: .cyan)
    }
    
    public var white: Style {
        return fg(basic: .white)
    }
    
    public var blackBright: Style {
        return fg(basic: .blackBright)
    }
    
    public var redBright: Style {
        return fg(basic: .redBright)
    }
    
    public var greenBright: Style {
        return fg(basic: .greenBright)
    }
    
    public var yellowBright: Style {
        return fg(basic: .yellowBright)
    }
    
    public var blueBright: Style {
        return fg(basic: .blueBright)
    }
    
    public var magentaBright: Style {
        return fg(basic: .magentaBright)
    }
    
    public var cyanBright: Style {
        return fg(basic: .cyanBright)
    }
    
    public var whiteBright: Style {
        return fg(basic: .whiteBright)
    }
    
    public var gray: Style {
        return blackBright
    }
    
    public var bgBlack: Style {
        return bg(basic: .black)
    }
    
    public var bgRed: Style {
        return bg(basic: .red)
    }
    
    public var bgGreen: Style {
        return bg(basic: .green)
    }
    
    public var bgYellow: Style {
        return bg(basic: .yellow)
    }
    
    public var bgBlue: Style {
        return bg(basic: .blue)
    }
    
    public var bgMagenta: Style {
        return bg(basic: .magenta)
    }
    
    public var bgCyan: Style {
        return bg(basic: .cyan)
    }
    
    public var bgWhite: Style {
        return bg(basic: .white)
    }
    
    public var bgBlackBright: Style {
        return bg(basic: .blackBright)
    }
    
    public var bgRedBright: Style {
        return bg(basic: .redBright)
    }
    
    public var bgGreenBright: Style {
        return bg(basic: .greenBright)
    }
    
    public var bgYellowBright: Style {
        return bg(basic: .yellowBright)
    }
    
    public var bgBlueBright: Style {
        return bg(basic: .blueBright)
    }
    
    public var bgMagentaBright: Style {
        return bg(basic: .magentaBright)
    }
    
    public var bgCyanBright: Style {
        return bg(basic: .cyanBright)
    }
    
    public var bgWhiteBright: Style {
        return bg(basic: .whiteBright)
    }
    
    public var bgGray: Style {
        return bgBlackBright
    }
}
