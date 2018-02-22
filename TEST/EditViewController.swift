//
//  EditViewController.swift
//  TEST
//
//  Created by Guillaume Sparrow-Pepin on 2/22/18.
//  Copyright © 2018 Guillaume Sparrow-Pepin. All rights reserved.
//

import Cocoa

class EditViewController: NSViewController {
    var device : Device?
    
    //View Variables
    
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var ipTextField: NSTextField!
    @IBOutlet weak var macTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        print("Connection established")
        if let name = device?.name {
            nameLabel.stringValue = name
            print(name)
        } else {
            print("no device found")
        }
        
        if let mac = device?.macAddress {
            macTextField.stringValue = mac
        }
        if let ip = device?.ipAddress {
            ipTextField.stringValue = ip
        }
        
    }
    
    @IBAction func donePressed(_ sender: Any) {
        dismissViewController(self)
    }
}
