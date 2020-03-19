//
//  File.swift
//  
//
//  Created by jinxiangqiu on 15/3/2020.
//

import Foundation
import Chalk

let name = """
  ______  __    __       ___       __       __  ___
 /      ||  |  |  |     /   \\     |  |     |  |/  /
|  ,----'|  |__|  |    /  ^  \\    |  |     |  '  /
|  |     |   __   |   /  /_\\  \\   |  |     |    <
|  `----.|  |  |  |  /  _____  \\  |  `----.|  .  \\
 \\______||__|  |__| /__/     \\__\\ |_______||__|\\__\\
"""

//print(
//    name.map {
//            ck.fg(.random).on(String($0))
//        }
//        .reduce(TerminalString()) {
//            $0 + $1
//        }
//)


//print(chalk.cyan.on("cyan"))  // `ck` is an alias to `chalk`
//
//// chainable
//print(ck.red.bgBlue.italic.underline.on("red bgBlue italic underline"))
//
//// combine terminal string and string
//print(ck.red.on("ERROR") + " something went wrong. " + ck.green.on("but no worry! I will..."))
//
//// rgb & hsl & hsv & hex support
//print(ck.fg(.rgb(0, 92, 197)).bg(.hex(0xFA4B8B)).on("meow"))
//
//// custom foreground color and background color with 100+ handpicked colors
//print(ck.fg(.darkMagenta).bg(.lightGoldenRodYellow).bold.on("hi"))

// nest
print(ck.magenta.underline.on("begin" + ck.red.bold.on("important") + "end"))
print(ck.magenta.underline.on("begin", ck.red.bold.on("important"), "end"))
