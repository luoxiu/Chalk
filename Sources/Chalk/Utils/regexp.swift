//
//  regexp.swift
//  Chalk
//
//  Created by Quentin Jin on 2018/11/1.
//

import Foundation

typealias RegExp = String

extension RegExp {

    func test(_ s: String) -> Bool {
        guard let regexp = try? NSRegularExpression(pattern: self, options: []) else { return false }
        return !regexp.matches(in: s, options: [], range: NSRange(location: 0, length: s.count)).isEmpty
    }
}
