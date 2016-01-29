// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
#else
import UIKit
#endif

public class USAnimator: NSObject {
    public class func sharedAnimator() -> USAnimator {
        return USKit.sharedInstance().animator
    }
    
    internal var animationsEnabled = true
}
