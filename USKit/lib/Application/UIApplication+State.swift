// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public enum UIApplicationState: Int {
    case Active
    case Inactive
    case Background
}

public let UIApplicationStateActive = UIApplicationState.Active
public let UIApplicationStateInactive = UIApplicationState.Inactive
public let UIApplicationStateBackground = UIApplicationState.Background

// =======================================================
// MARK: - Notifications

public let UIApplicationWillEnterForegroundNotification = "UIApplicationWillEnterForegroundNotification"
public let UIApplicationDidBecomeActiveNotification = "UIApplicationDidBecomeActiveNotification"
public let UIApplicationWillResignActiveNotification = "UIApplicationWillResignActiveNotification"
public let UIApplicationDidEnterBackgroundNotification = "UIApplicationDidEnterBackgroundNotification"
public let UIApplicationWillTerminateNotification = "UIApplicationWillTerminateNotification"
    
// =======================================================
// MARK: -
    
extension UIApplication {
    public var applicationState: UIApplicationState {
        get { return USApplication.sharedApplication().applicationState }
    }
}
    
#endif