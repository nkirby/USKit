// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

@objc public protocol UIApplicationDelegate: NSObjectProtocol {
    // Launching
    optional func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    optional func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    
    // Transitioning
    optional func applicationWillEnterForeground(application: UIApplication)
    optional func applicationDidBecomeActive(application: UIApplication)
    optional func applicationWillResignActive(application: UIApplication)
    optional func applicationDidEnterBackground(application: UIApplication)
    
    // Termination
    optional func applicationWillTerminate(application: UIApplication)
    
    // Unavailable
    optional func applicationDidFinishLaunching(application: UIApplication)
    optional func applicationProtectedDataWillBecomeUnavailable(application: UIApplication)
    optional func applicationProtectedDataDidBecomeAvailable(application: UIApplication)
    optional func applicationDidReceiveMemoryWarning(application: UIApplication)
    optional func applicationSignificantTimeChange(application: UIApplication)
}

#endif