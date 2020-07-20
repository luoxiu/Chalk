//
//  Color.swift
//  Chalk
//
//  Created by Quentin Jin on 2018/10/19.
//

import Foundation

#if COCOAPODS
@_exported import RainbowPod
public typealias RainbowColor = RainbowPod.Color
#else
@_exported import Rainbow
public typealias RainbowColor = Rainbow.Color
#endif

public protocol TerminalColor {
    
    var fgOpenCode: String { get }
    var bgOpenCode: String { get }
}

extension TerminalColor {

    public var fgCloseCode: String {
        return "\u{001B}[39m"
    }

    public var bgCloseCode: String {
        return "\u{001B}[49m"
    }
}

public enum ANSI16Color: UInt8 {
    case black = 30
    case red
    case green
    case yellow
    case blue
    case magenta
    case cyan
    case white

    case blackBright = 90
    case redBright
    case greenBright
    case yellowBright
    case blueBright
    case magentaBright
    case cyanBright
    case whiteBright
}

extension ANSI16Color: TerminalColor {
    
    private func code(offset: UInt8) -> String {
        return "\u{001B}[\(rawValue + offset)m"
    }
    
    public var fgOpenCode: String {
        return code(offset: 0)
    }
    
    public var bgOpenCode: String {
        return code(offset: 10)
    }
}

extension RainbowColor: TerminalColor {
    
    private func code(offset: UInt8) -> String {
        switch TerminalSupportedColor.current {
        case .ansi16m:
            let rgba = self.rgba
            return "\u{001B}[\(38 + offset);2;\(rgba.red);\(rgba.green);\(rgba.blue)m"
        case .ansi256:
            return "\u{001B}[\(38 + offset);5;\(ansi256)m"
        case .ansi16, .none:
            return "\u{001B}[\(UInt8(ansi16) + offset)m"
        }
    }

    public var fgOpenCode: String {
        return code(offset: 0)
    }

    public var bgOpenCode: String {
        return code(offset: 10)
    }
}
