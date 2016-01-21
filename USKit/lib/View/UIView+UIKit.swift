//
//  UIView+UIKit.swift
//  USKit
//
//  Created by Nate Kirby on 1/20/16.
//  Copyright © 2016 Nate Kirby. All rights reserved.
//

#if os(iOS)
import UIKit

    extension UIView {
        private(set) public var backingView: UIView? {
            get { return nil }
            set { }
        }
        public var shouldSendTouchEventsAsMouseEvents: Bool {
            get { return false }
            set { }
        }
    }

#endif
