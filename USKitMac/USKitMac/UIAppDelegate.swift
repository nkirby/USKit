//
//  UIAppDelegate.swift
//  USKitMac
//
//  Created by Nate Kirby on 1/18/16.
//  Copyright © 2016 Nate Kirby. All rights reserved.
//

import Cocoa
import USKit

class UIAppDelegate: NSObject, UIApplicationDelegate {
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        NSLog("Will finish launching")
        return true
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        NSLog("Did finish launching")
        return true
    }
}
