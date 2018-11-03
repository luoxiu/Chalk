//
//  Modifier.swift
//  Crayon
//
//  Created by Quentin MED on 2018/10/19.
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
    case crossedOut         // aka strikethrough
}
