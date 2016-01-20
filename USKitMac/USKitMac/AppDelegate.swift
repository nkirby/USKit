//
//  AppDelegate.swift
//  USKitMac
//
//  Created by Nate Kirby on 1/18/16.
//  Copyright © 2016 Nate Kirby. All rights reserved.
//

import Cocoa
import USKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let appDelegate = UIAppDelegate()
        USApplication.sharedApplication().forwardApplicationLifecycleTo(appDelegate)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

