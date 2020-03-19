//
//  File.swift
//  
//
//  Created by jinxiangqiu on 18/3/2020.
//

import Foundation

public struct TerminalString {
    
    let strings: [(String, Style)]
    
    public var string: String {
        strings.map { $0.0 }.joined()
    }
}

extension TerminalString: CustomStringConvertible {
    
    public var description: String {
        strings.map {
            switch TerminalSupportedColor.current {
            case .none:
                return $0.0
            default:
                var openCodes: [String] = []
                var closeCodes: [String] = []
                if let modifiers = $0.1.modifiers {
                    openCodes.append(contentsOf: modifiers.map({ $0.openCode }))
                    closeCodes.append(contentsOf: modifiers.map({ $0.closeCode }))
                }
                if let color = $0.1.fgColor {
                    openCodes.append(color.fgOpenCode)
                    closeCodes.append(color.fgCloseCode)
                }
                if let color = $0.1.bgColor {
                    openCodes.append(color.bgOpenCode)
                    closeCodes.append(color.bgCloseCode)
                }
                return openCodes.joined() + $0.0 + closeCodes.joined()
            }
        }
        .joined()
    }
}

// MAKR: Style
extension Style {
    
    private func on(_ other: Style) -> Style {
        var style = self
        style.fgColor = other.fgColor ?? style.fgColor
        style.bgColor = other.bgColor ?? style.bgColor
        if style.modifiers == nil {
            style.modifiers = other.modifiers
        } else {
            style.modifiers?.formUnion(modifiers ?? [])
        }
        return style
    }
    
    public func on(_ terminalStringConvertibles: TerminalStringConvertible...) -> TerminalString {
        let strings = terminalStringConvertibles
            .flatMap {
                $0.terminalString
                    .strings
                    .map {
                        ($0.0, self.on($0.1))
                    }
            }
        return TerminalString(strings: strings)
    }
}
