//
//  TerminalColorLevel.swift
//  Crayon
//
//  Created by Quentin MED on 2018/11/1.
//

import Foundation

// https://github.com/chalk/supports-color

public enum TerminalColorLevel {
    case none
    case basic
    case is256
    case is16m
    
    public static var current: TerminalColorLevel = {
        if isatty(fileno(stdout)) == 0 {
            return .none
        }
        
        let env = ProcessInfo().environment
        
        if env["CI"] != nil {
            for ci in ["TRAVIS", "CIRCLECI", "APPVEYOR", "GITLAB_CI"] {
                if env[ci] != nil { return .basic }
            }
            return .none
        }
        
        if env["TEAMCITY_VERSION"] != nil {
            return "^(9\\.(0*[1-9]\\d*)\\.|\\d{2,}\\.)".test(env["TEAMCITY_VERSION"] ?? "") ? .basic : .none
        }
        
        if env["COLORTERM"]?.lowercased() == "truecolor" {
            return .is16m
        }
        
        if let app = env["TERM_PROGRAM"] {
            if let version = env["TERM_PROGRAM_VERSION"], let major = version.split(separator: ".").first, let n = Int(major) {
                switch app {
                case "iTerm.app":           return n >= 3 ? .is16m : .is256
                case "Apple_Terminal":  	return .is256
                default:                	break
                }
            }
        }
        
        if let term = env["TERM"]?.lowercased() {
            if "-256(color)?$".test(term) {
                return .is256
            }
            
            for e in ["^screen", "^xterm", "^vt100", "^vt220", "^rxvt", "color", "ansi", "cygwin", "linux"] {
                if e.test(term) {
                    return .basic
                }
            }
        }
        
        if env["COLORTERM"] != nil {
            return .basic
        }
        
        if env["TERM"] == "dumb" {
            return .none
        }
        
        return .none
    }()
}
