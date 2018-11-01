//
//  TerminalString.swift
//  Crayon
//
//  Created by Quentin MED on 2018/10/19.
//

import Foundation

public let crayon = TerminalString()

public struct TerminalString {

    private var s = ""

    private var fg = Color.default

    private var bg = Color.default

    private var modifiers: Set<Modifier> = []

    init() { }

    public func apply(_ s: String) -> TerminalString {
        var copy = self
        copy.s = s
        return copy
    }
}

extension TerminalString {

    public func fg(_ color: Color) -> TerminalString {
        var copy = self
        copy.fg = color
        return copy
    }

    public func bg(_ color: Color) -> TerminalString {
        var copy = self
        copy.bg = color
        return copy
    }

    public func modify(_ modifier: Modifier) -> TerminalString {
        var copy = self
        copy.modifiers.insert(modifier)
        return copy
    }
}

extension TerminalString {

    var rendered: String {
        switch TerminalColorLevel.current {
        case .none:         return s
        case .basic:
            var codes: [UInt8] = []
            codes.append(fg.rawValue)
            codes.append(bg.rawValue)
            codes.append(contentsOf: modifiers.map { $0.rawValue })
            let joined = codes.map { String($0) }.joined(separator: ";")
            return "\u{001B}[\(joined)m\(s)\u{001B}0m"
        case .is256:         return s
        case .is16m:         return s
        }
    }
}
