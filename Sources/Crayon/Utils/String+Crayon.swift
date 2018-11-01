//
//  String+Crayon.swift
//  Crayon
//
//  Created by Quentin MED on 2018/11/1.
//

import Foundation

extension String {

    func test(_ s: String) -> Bool {
        guard let regexp = try? NSRegularExpression(pattern: self, options: []) else { return false }
        return !regexp.matches(in: s, options: [], range: NSRange(location: 0, length: s.count)).isEmpty
    }
}
