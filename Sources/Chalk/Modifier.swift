//
//  Modifier.swift
//  Chalk
//
//  Created by Quentin Jin on 2018/10/19.
//

import Foundation

public enum Modifier: UInt8 {
    case reset
    case bold
    case faint              // aka dim, not widely supported.
    case italic
    case underline
    case blink
    case reverse = 7
    case conceal            // aka hidden, not widely supported.
    case crossedOut         // aka strikethrough, not widely supported.
}

extension Modifier {

    var code: String {
        return "\u{001B}[\(rawValue)m"
    }

    var closeCode: String {
        var c: Int
        switch self {
        case .reset:        c = 0
        case .bold, .faint: c = 22
        case .italic:       c = 23
        case .underline:    c = 24
        case .blink:        c = 25
        case .reverse:      c = 27
        case .conceal:      c = 28
        case .crossedOut:   c = 29
        }
        return "\u{001B}[\(c)m"
    }
}
