//
//  DefaultJson.swift
//  SimPush
//
//  Created by Reza Khonsari on 4/5/20.
//  Copyright © 2020 Reza Khonsari. All rights reserved.
//

import Foundation



let DefaultJSON = """
{
  "aps": {
    "alert": {
      "title": "Welcome Push Notification",
      "body": "Congratulation From APNS💃🏻🕺🏽",
      "sound": "default"
    },
    "badge": 1
  },
  "Simulator Target Bundle": "PRODUCT_BUNDLE_IDENTIFIER"
}
"""
