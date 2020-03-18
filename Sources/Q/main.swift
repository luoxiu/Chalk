//
//  File.swift
//  
//
//  Created by jinxiangqiu on 15/3/2020.
//

import Foundation
@testable import Chalk

extension String {
    
    var success: String {
        return ck.green.on(self).description
    }
    
    var failure: String {
        return ck.red.on(self).description
    }
}

func say(_ msg: String) {
    print(ck.cyan.bold.on("Q:"), msg)
}

Chalk.__global_supported_color__ = .ansi16m

say("success".success)
say("failure".failure)

let s = ck.cyan.underline.on("blue underline", ck.fg(.black).bg(.pink).bold.on("pink white bold"), ck.italic.crossedOut.on("italic crossed out"))
print(s)

print(ck.red.on("foo", ck.underline.bgBlue.on("bar"), "!"))

print(TerminalSupportedColor.current)
print(ck.red.on("foo", ck.red.bold.on("bar"), ck.blue.bgYellow.on("foo"), "bar"))

print(ck.red.on("a" + ck.yellow.on("b" + ck.green.on("c") + "b") + "c"))
