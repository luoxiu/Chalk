//
//  TerminalString.swift
//  Crayon
//
//  Created by Quentin MED on 2018/11/2.
//

import Foundation

public struct TerminalString {
    
    let s: String
    let style: Style
    
    init(s: String, style: Style) {
        self.s = s
        self.style = style
    }
}

extension TerminalString: TerminalStringCompatible {
    
    public var raw: String {
        var codes = ""
        var closeCodes = ""
        if let modifiers = style.modifiers {
            codes.append(modifiers.map({ $0.code }).joined())
            closeCodes.append(modifiers.map({ $0.closeCode }).joined())
        }
        if let fg = style.fg {
            codes.append(fg.fgCode)
            closeCodes.append(fg.fgCloseCode)
        }
        if let bg = style.bg {
            codes.append(bg.bgCode)
            closeCodes.append(bg.bgCloseCode)
        }
        return codes + s + closeCodes
    }
}

extension TerminalString {

    public static func + (lhs: String, rhs: TerminalString) -> String {
        return lhs + rhs.raw
    }

    public static func + (lhs: TerminalString, rhs: String) -> String {
        return lhs.raw + rhs
    }
}

extension TerminalString: CustomStringConvertible, CustomDebugStringConvertible {

    public var description: String {
        return raw
    }

    public var debugDescription: String {
        // TODO: Print style infos.
        return raw
    }
}
