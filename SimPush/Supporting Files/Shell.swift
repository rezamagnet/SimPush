//
//  Shell.swift
//  SimPush
//
//  Created by Reza Khonsari on 4/5/20.
//  Copyright © 2020 Reza Khonsari. All rights reserved.
//

import Foundation


enum ShellError : Error {
    case apnsPathIsIncorrect(NSError)
}

func doShell(_ args: String...) throws -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    if task.terminationStatus != 0 {
        let error = NSError(domain: "APNS file dosen't exist.", code: Int(task.terminationStatus))
        throw ShellError.apnsPathIsIncorrect(error)
    }
    return task.terminationStatus
}
