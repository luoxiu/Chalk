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
    case dim
    case italic
    case underline
    case inverse = 7
    case hidden
    case strikethrough
}
