//
//  ViewController.swift
//  USKitMac
//
//  Created by Nate Kirby on 1/18/16.
//  Copyright © 2016 Nate Kirby. All rights reserved.
//

import Cocoa
import USKit

class TestView: UIView {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("touchesBegan")
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("touchesEnded")
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("touchesMoved")
    }
    override func touchesCancelled(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("touchesEnded")
    }
}

class ViewController: NSViewController {
    private let containerView = USContainerView(frame: NSRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.containerView.frame = self.view.bounds
        self.containerView.autoresizingMask = [.ViewWidthSizable, .ViewHeightSizable]
        self.view.addSubview(self.containerView)
        
        let testView = TestView(frame: self.containerView.bounds)
        testView.wantsLayer = true
        testView.layer?.backgroundColor = NSColor.redColor().CGColor
        self.containerView.addSubview(testView)
    }

    override func viewWillLayout() {
        super.viewWillLayout()
        self.containerView.frame = self.view.bounds
    }
}

