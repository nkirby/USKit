// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public typealias UIUserInterfaceLayoutDirection = NSUserInterfaceLayoutDirection
public let UIUserInterfaceLayoutDirectionLeftToRight = UIUserInterfaceLayoutDirection.LeftToRight
public let UIUserInterfaceLayoutDirectionRightToLefft = UIUserInterfaceLayoutDirection.RightToLeft

// =======================================================

extension UIApplication {
    public var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        get { return NSApplication.sharedApplication().userInterfaceLayoutDirection }
    }
}
    
#endif