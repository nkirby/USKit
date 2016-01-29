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
//        NSLog("touchesMoved")
    }
    override func touchesCancelled(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        NSLog("touchesEnded")
    }
    override func didAddSubview(subview: UIView) {
        USLog("didAdd: \(subview)")
    }
}

class Test2View: UIControl {
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//        self.frame = CGRectOffset(self.frame, 10.0, 10.0)
//    }
//    
//    override func willMoveToSuperview(newSuperview: UIView) {
//        USLog("willMoveToSuperview")
//    }
//    
//    override func didMoveToSuperview() {
//        USLog("didMoveToSuperview")
//    }
}

class ViewController: NSViewController {
    private let containerView = USContainerView(frame: NSRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let containerViewFrame = CGRect(x: 44, y: 0, width: self.view.frame.size.width - 44.0, height: self.view.frame.size.height)
        self.containerView.frame = containerViewFrame //self.view.bounds
        self.containerView.autoresizingMask = [.ViewWidthSizable, .ViewHeightSizable]
        self.view.addSubview(self.containerView)
        
        let testView = TestView(frame: self.containerView.bounds)
        testView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        testView.backgroundColor = NSColor.redColor()
        self.containerView.presentView(testView)
        
        let blueView = Test2View(frame: CGRect(x: 10, y: 10, width: 44, height: 44))
        blueView.backgroundColor = NSColor.blueColor()
        blueView.autoresizingMask = [.FlexibleBottomMargin, .FlexibleRightMargin]
        testView.addSubview(blueView)
        
        blueView.addTarget(self, action: "didTap:", forControlEvents: .TouchDown)
    }

    override func viewWillLayout() {
        super.viewWillLayout()
        
        let containerViewFrame = CGRect(x: 44, y: 0, width: self.view.frame.size.width - 44.0, height: self.view.frame.size.height)
        self.containerView.frame = containerViewFrame
    }
    
    @objc private func didTap(sender: UIView) {
        USLog("tap")
        UIView.animateWithDuration(0.5, animations: {
            sender.frame = CGRect(x: 40, y: 40, width: 100, height: 100)
        })
        
//        let view1 = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 400, height: 400)))
//        let view2 = UIView(frame: CGRect(x: 10, y: 10, width: 44, height: 44))
//        let view3 = UIView(frame: CGRect(x: 40, y: 40, width: 900, height: 900))
//        let view4 = UIView(frame: CGRect(x: 0, y: 0, width: 900, height: 900))
//        
//        view1.addSubview(view2)
//        view1.addSubview(view3)
//        view3.addSubview(view4)
//        
//        let point = CGPoint(x: 10, y: 10)
//        
//        print("convertA: \(view1.convertPoint(point, toView: view1))")
//        print("convertA: \(view1.convertPoint(point, toView: view2))")
//        print("convertA: \(view2.convertPoint(point, toView: view1))")
//        print("convertA: \(view1.convertPoint(point, toView: view3))")
//        print("convertA: \(view3.convertPoint(point, toView: view1))")
//        print("convertA: \(view4.convertPoint(point, toView: view3))")
//        print("convertA: \(view4.convertPoint(point, toView: view1))")
//        print("---")
//        print("convertB: \(view1.convertPoint(point, fromView: view1))")
//        print("convertB: \(view1.convertPoint(point, fromView: view2))")
//        print("convertB: \(view2.convertPoint(point, fromView: view1))")
//        print("convertB: \(view1.convertPoint(point, fromView: view3))")
//        print("convertB: \(view3.convertPoint(point, fromView: view1))")
//        print("convertB: \(view4.convertPoint(point, fromView: view3))")
//        print("convertB: \(view4.convertPoint(point, fromView: view1))")
    }
}

