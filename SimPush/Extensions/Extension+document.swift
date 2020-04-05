//
//  Extension+document.swift
//  SimPush
//
//  Created by Reza Khonsari on 4/5/20.
//  Copyright © 2020 Reza Khonsari. All rights reserved.
//

import Foundation


extension FileManager {
    static var document : URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
