//
//  TerminalStringCompatible.swift
//  Crayon
//
//  Created by Quentin Jin on 2018/11/4.
//

import Foundation

public protocol TerminalStringCompatible {

    var raw: String { get }
}

extension String: TerminalStringCompatible {

    public var raw: String { return self }
}
