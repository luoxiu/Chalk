//
//  File.swift
//  
//
//  Created by jinxiangqiu on 15/3/2020.
//

import Foundation
import Chalk

extension String {
    
    var success: String {
        return ck.green.on(self).description
    }
    
    var failure: String {
        return ck.red.on(self).description
    }
}

let fmt = DateFormatter()
fmt.locale = Locale(identifier: "en_US_POSIX")
fmt.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"

extension Date {
    var timestamp: String {
        return fmt.string(from: self)
    }
}

func say(_ msg: String) {
    print(ck.cyan.dim.on(Date().timestamp), msg)
}

say("success".success)
say("failure".failure)

print(ck.red.on("a" + ck.yellow.on("b" + ck.green.on("c") + "b") + "c"))
