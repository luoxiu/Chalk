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

print(
    name.map {
            ck.fg(.random).on(String($0))
        }
        .reduce(TerminalString()) {
            $0 + $1
        }
)

