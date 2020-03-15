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
        return ck.fg(.springGreen).on(self).description
    }
    
    var failure: String {
        return ck.fg(.red).on(self).description
    }
}

func say(_ msg: String) {
    print(ck.cyan.bold.on("Q:"), msg)
}

say("success".success)
say("failure".failure)
