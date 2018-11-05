//
//  TerminalStringCompatible.swift
//  Crayon
//
//  Created by Quentin Jin on 2018/11/4.
//

import Foundation

public protocol TerminalStringCompatible {

    var rendered: String { get }
}

extension String: TerminalStringCompatible {

    public var rendered: String { return self }
}
