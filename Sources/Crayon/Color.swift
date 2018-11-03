//
//  Color.swift
//  Crayon
//
//  Created by Quentin MED on 2018/10/19.
//

import Foundation
@_exported import Rainbow

public protocol TerminalColor {
    
    var fgCode: String { get }
    var bgCode: String { get }
}

public enum BasicColor: UInt8 {
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

extension BasicColor: TerminalColor {
    
    private func code(offset: UInt8) -> String {
        return "\(rawValue + offset)"
    }
    
    public var fgCode: String {
        return code(offset: 0)
    }
    
    public var bgCode: String {
        return code(offset: 10)
    }
}

public typealias RainbowColor = Rainbow.Color

extension RainbowColor: TerminalColor {
    
    private func code(offset: UInt8) -> String {
        switch TerminalColorSupportLevel.current {
        case .ansi16m:
            let rgba = self.rgba
            return "\(38 + offset);2;\(rgba.red);\(rgba.green);\(rgba.blue)"
        case .ansi256:
            return "\(38 + offset);5;\(ansi256)"
        case .ansi16:
            return "\(UInt8(ansi16) + offset)"
        default:    return ""
        }
    }

    public var fgCode: String {
        return code(offset: 0)
    }

    public var bgCode: String {
        return code(offset: 10)
    }
}
