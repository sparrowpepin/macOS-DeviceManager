//
//  Device.swift
//  TEST
//
//  Created by Guillaume Sparrow-Pepin on 2/22/18.
//  Copyright © 2018 Guillaume Sparrow-Pepin. All rights reserved.
//

import Foundation

class Device {
    var name: String
    var location: String?
    var macAddress: String?
    var ipAddress: String?
    
    init(name: String, location: String?, macAddress: String?, ipAddress: String?) {
        self.name = name
        self.location = location
        self.macAddress = macAddress
        self.ipAddress = ipAddress
    }
}
