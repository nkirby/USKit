// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
#else
import UIKit
#endif

internal struct USTargetAction {
    internal let target: NSObject?
    internal let action: Selector
    
    internal init(target: NSObject?, action: Selector) {
        self.target = target
        self.action = action
    }
}

extension USTargetAction: Equatable {}

internal func == (lhs: USTargetAction, rhs: USTargetAction) -> Bool {
    return lhs.target == rhs.target && lhs.action == rhs.action
}
