//
//  File.swift
//  
//
//  Created by jinxiangqiu on 19/3/2020.
//

public protocol TerminalStringConvertible {
    
    var terminalString: TerminalString { get }
}

extension TerminalString: TerminalStringConvertible {
    
    public var terminalString: TerminalString {
        return self
    }
}

extension String: TerminalStringConvertible {
    
    public var terminalString: TerminalString {
        return TerminalString(strings: [(self, Style())])
    }
}

