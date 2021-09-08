//
//  Shell.swift
//  SimPush
//
//  Created by Reza Khonsari on 4/5/20.
//  Copyright © 2020 Reza Khonsari. All rights reserved.
//

import Foundation


enum ShellError : Error {
    case APNSPathIsIncorrect
}

func doShell(_ args: String...) throws -> Int32 {
    let task = Process()
    task.launchPath = "/bin/zsh"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    guard task.terminationStatus == 0 else { throw ShellError.APNSPathIsIncorrect }
    return task.terminationStatus
}
