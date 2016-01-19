// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public final class USApplication: NSObject {
    internal var uiApplication: UIApplication?
    
    public var applicationStartupDelay: NSTimeInterval = 1.0
    
    private static let _sharedApplication = USApplication()
    public static func sharedApplication() -> USApplication {
        return self._sharedApplication
    }
    
    public func forwardApplicationLifecycleTo(delegate: UIApplicationDelegate) {
        let uiApplication = UIApplication(delegate: delegate)
        self.uiApplication = uiApplication
        
        Dispatch.main {
            delegate.application?(uiApplication, willFinishLaunchingWithOptions: nil)
        }
        
        Dispatch.main(self.applicationStartupDelay) {
            delegate.application?(uiApplication, didFinishLaunchingWithOptions: nil)
        }
    }
}

#endif