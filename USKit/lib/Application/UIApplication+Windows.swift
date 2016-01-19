// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

extension UIApplication {
    public var keyWindow: UIWindow? {
        get { return NSApplication.sharedApplication().keyWindow }
    }
    
    public var windows: [UIWindow] {
        get { return NSApplication.sharedApplication().windows }
    }
}
    
#endif