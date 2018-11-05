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
    
    public var rendered: String {
        var codes = ""
        var closeCodes = ""
        if let modifiers = style.modifiers {
            codes.append(modifiers.map({ $0.code }).joined())
            closeCodes.append(modifiers.map({ $0.closeCode }).joined())
        }

        var s = self.s
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
        return lhs + rhs.rendered
    }

    public static func + (lhs: TerminalString, rhs: String) -> String {
        return lhs.rendered + rhs
    }
}

extension TerminalString: CustomStringConvertible, CustomDebugStringConvertible {

    public var description: String {
        return rendered
    }

    public var debugDescription: String {
        // TODO: Print style infos.
        return rendered
    }
}

extension TerminalString: Hashable {

    public var hashValue: Int {
        return rendered.hashValue
    }

    public static func == (lhs: TerminalString, rhs: TerminalString) -> Bool {
        return lhs.rendered == rhs.rendered
    }
}

extension TerminalString {

    public static func == (lhs: String, rhs: TerminalString) -> Bool {
        return lhs == rhs.rendered
    }

    public static func == (lhs: TerminalString, rhs: String) -> Bool {
        return lhs.rendered == rhs
    }
}
