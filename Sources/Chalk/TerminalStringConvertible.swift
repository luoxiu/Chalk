//
//  TerminalStringCompatible.swift
//  Chalk
//
//  Created by Quentin Jin on 2018/11/4.
//

import Foundation

public protocol TerminalStringConvertible {

    var terminalDescription: String { get }
}

extension String: TerminalStringConvertible {

    public var terminalDescription: String { return self }
}
