// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
#else
import UIKit
#endif

public class USKit: NSObject {
    private static let _shared = USKit()
    public class func sharedInstance() -> USKit {
        return self._shared
    }

    public let animator = USAnimator()
    
    public func setupUIKitBridge() {
        #if os(OSX)
        NSAnimationContext.currentContext().allowsImplicitAnimation = true
        #endif
    }
}
