// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
#else
import UIKit
#endif

internal struct USControlAction {
    internal let action: Selector
    internal let target: NSObject?
    internal let controlEvents: UIControlEvents
    
    internal init(action: Selector, target: NSObject?, controlEvents: UIControlEvents) {
        self.action = action
        self.target = target
        self.controlEvents = controlEvents
    }
}

extension USControlAction: Equatable {}

internal func == (lhs: USControlAction, rhs: USControlAction) -> Bool {
    return lhs.action == rhs.action && lhs.target == rhs.target && lhs.controlEvents == rhs.controlEvents
}
