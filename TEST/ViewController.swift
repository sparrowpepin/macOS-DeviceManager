//
//  ViewController.swift
//  TEST
//
//  Created by Guillaume Sparrow-Pepin on 2/21/18.
//  Copyright © 2018 Guillaume Sparrow-Pepin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var devices : [Device] = []
    var selectedDevice : Device?
    
    //View Variables
    @IBOutlet weak var mainLabel: NSTextField!
    @IBOutlet weak var ipAddressLabel: NSTextField!
    @IBOutlet weak var macAddressLabel: NSTextField!
    
    
    //Table View
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        createDevices()

        tableView.reloadData()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func setViewWithDevice(device: Device) {
        mainLabel.stringValue = device.name
        
        if let ip = device.ipAddress {
            ipAddressLabel.stringValue = ip
        } else {
            ipAddressLabel.stringValue = ""
        }
        
        if let mac = device.macAddress {
            macAddressLabel.stringValue = mac
        } else {
            macAddressLabel.stringValue = ""
        }
        
    
    }
    
    func createDevices(){
        //1
        self.devices.append(Device(name: "Core Switch", location: "Shack", macAddress: nil, ipAddress: "10.42.0.254"))
        self.devices.append(Device(name: "PFSense", location: "Shack", macAddress: nil, ipAddress: "10.42.0.1"))
    }
    
    
    @IBAction func editPressed(_ sender: Any) {
        performSegue(withIdentifier: NSStoryboardSegue.Identifier(rawValue: "editSegue"), sender: sender)
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        print("preparing segue")
        
        if segue.identifier!.rawValue == "editSegue" {
            if let editViewController = segue.destinationController as? EditViewController {
                editViewController.device = self.selectedDevice
            }
        }
    }

}

extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return devices.count
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MainCell"), owner: self) as! NSTableCellView
        
        cellView.textField!.stringValue = devices[row].name
        
        return cellView
    }
    
    
}

extension ViewController: NSTableViewDelegate {
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        setViewWithDevice(device: devices[tableView.selectedRow])
        self.selectedDevice = devices[tableView.selectedRow]
    }
    
}
