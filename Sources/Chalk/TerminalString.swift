//
//  TerminalString.swift
//  Chalk
//
//  Created by Quentin Jin on 2018/11/2.
//

import Foundation

public struct TerminalString {
    
    let string: String
    let style: Style
    
    init(string: String, style: Style) {
        self.string = string
        self.style = style
    }
}

extension TerminalString: TerminalStringConvertible {
    
    public var terminalDescription: String {
        var codes = ""
        var closeCodes = ""
        if let modifiers = style.modifiers {
            codes.append(modifiers.map({ $0.code }).joined())
            closeCodes.append(modifiers.map({ $0.closeCode }).joined())
        }

        var s = self.string
        if let fg = style.fg {
            codes.append(fg.fgCode)
            if s.contains(fg.fgCloseCode) {
                s = s.replacingOccurrences(of: fg.fgCloseCode, with: fg.fgCode)
            }
            closeCodes.append(fg.fgCloseCode)
        }
        if let bg = style.bg {
            codes.append(bg.bgCode)
            if s.contains(bg.bgCloseCode) {
                s = s.replacingOccurrences(of: bg.bgCloseCode, with: bg.bgCode)
            }
            closeCodes.append(bg.bgCloseCode)
        }
        return codes + s + closeCodes
    }
}

extension TerminalString {

    public static func + (lhs: String, rhs: TerminalString) -> String {
        return lhs + rhs.terminalDescription
    }

    public static func + (lhs: TerminalString, rhs: String) -> String {
        return lhs.terminalDescription + rhs
    }
}

extension TerminalString: CustomStringConvertible, CustomDebugStringConvertible {

    public var description: String {
        return terminalDescription
    }

    public var debugDescription: String {
        return terminalDescription
    }
}

extension TerminalString: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(terminalDescription)
    }
    
    public static func == (lhs: TerminalString, rhs: TerminalString) -> Bool {
        lhs.terminalDescription == rhs.terminalDescription
    }
}

extension TerminalString {

    public static func == (lhs: String, rhs: TerminalString) -> Bool {
        return lhs == rhs.terminalDescription
    }

    public static func == (lhs: TerminalString, rhs: String) -> Bool {
        return lhs.terminalDescription == rhs
    }
}
