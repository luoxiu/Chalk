//
//  TerminalString.swift
//  Crayon
//
//  Created by Quentin MED on 2018/11/2.
//

import Foundation

public struct TerminalString {
    
    private let s: String
    private let style: Style
    
    init(s: String, style: Style) {
        self.s = s
        self.style = style
    }
}

extension TerminalString {
    
    var rendered: String {
        var codes = ""
        if let modifiers = style.modifiers {
            codes.append(modifiers.map({ String($0.rawValue) }).joined(separator: ";"))
        }
        if let fg = style.fg {
            codes.append(";\(fg.fgCode)")
        }
        if let bg = style.bg {
            codes.append(";\(bg.bgCode)")
        }
        return "\u{001B}[\(codes)m\(s)\u{001B}[0m"
    }
}
