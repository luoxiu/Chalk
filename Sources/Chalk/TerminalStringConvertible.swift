public protocol TerminalStringConvertible {
    var terminalString: TerminalString { get }
}

extension TerminalString: TerminalStringConvertible {
    public var terminalString: TerminalString {
        self
    }
}

extension String: TerminalStringConvertible {
    public var terminalString: TerminalString {
        TerminalString(strings: [(self, Style())])
    }
}
