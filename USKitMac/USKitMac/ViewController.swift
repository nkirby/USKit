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

class Test2View: UIView {
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        NSLog("2: touchesBegan")
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
        testView.autoresizingMask = [.ViewWidthSizable, .ViewHeightSizable]
        testView.backgroundColor = NSColor.redColor()
        self.containerView.presentView(testView)
        
        let blueView = Test2View(frame: CGRect(x: 10, y: 10, width: 44, height: 44))
        blueView.backgroundColor = NSColor.blueColor()
        blueView.autoresizingMask = [.ViewMinYMargin, .ViewMaxXMargin]
        testView.addSubview(blueView)
    }

    override func viewWillLayout() {
        super.viewWillLayout()
        self.containerView.frame = self.view.bounds
    }
}

