// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public final class USApplication: NSObject {
    internal var applicationState = UIApplicationState.Background
    internal var uiApplication: UIApplication?
    
    // Config?
    public var applicationStartupDelay: NSTimeInterval = 1.0
    
// =======================================================
// MARK: - Init, etc...
    
    private static let _sharedApplication = USApplication()
    public static func sharedApplication() -> USApplication {
        return self._sharedApplication
    }
    
// =======================================================
// MARK: - Forwarding
    
    public func forwardApplicationLifecycleTo(delegate: UIApplicationDelegate) {
        let uiApplication = UIApplication(delegate: delegate)
        self.uiApplication = uiApplication
        
        USDispatch.main {
            delegate.application?(uiApplication, willFinishLaunchingWithOptions: nil)
        }
        
        self.setupNotificationObservers()
        
        USDispatch.main(self.applicationStartupDelay) {
            delegate.application?(uiApplication, didFinishLaunchingWithOptions: nil)
        }
    }
    
// =======================================================
// MARK: - Setup
    
    private func setupNotificationObservers() {
        // Lifecycle
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillBecomeActive:", name: NSApplicationWillBecomeActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationDidBecomeActive:", name: NSApplicationDidBecomeActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillResignActive:", name: NSApplicationWillResignActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationDidEnterBackground:", name: NSApplicationDidResignActiveNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationWillTerminate:", name: NSApplicationWillTerminateNotification, object: nil)
    }
    
// =======================================================
// MARK: - Lifecycle
    
    @objc private func applicationWillBecomeActive(sender: NSNotification) {
        defer {
            NSNotificationCenter.defaultCenter().postNotificationName(UIApplicationWillEnterForegroundNotification, object: self.uiApplication)
        }
        
        guard let application = self.uiApplication,
            let delegate = application.delegate else {
                return
        }
        
        delegate.applicationWillEnterForeground?(application)
    }
    
    @objc private func applicationDidBecomeActive(sender: NSNotification) {
        defer {
            NSNotificationCenter.defaultCenter().postNotificationName(UIApplicationDidBecomeActiveNotification, object: self.uiApplication)
        }
        
        guard let application = self.uiApplication,
            let delegate = application.delegate else {
                return
        }

        self.applicationState = .Active
        delegate.applicationDidBecomeActive?(application)
    }
    
    @objc private func applicationWillResignActive(sender: NSNotification) {
        defer {
            NSNotificationCenter.defaultCenter().postNotificationName(UIApplicationWillResignActiveNotification, object: self.uiApplication)
        }
        
        guard let application = self.uiApplication,
            let delegate = application.delegate else {
                return
        }

        delegate.applicationWillResignActive?(application)
    }
    
    @objc private func applicationDidEnterBackground(sender: NSNotification) {
        defer {
            NSNotificationCenter.defaultCenter().postNotificationName(UIApplicationDidEnterBackgroundNotification, object: self.uiApplication)
        }
        
        guard let application = self.uiApplication,
            let delegate = application.delegate else {
                return
        }
        
        self.applicationState = .Background
        delegate.applicationDidEnterBackground?(application)
    }
    
    @objc private func applicationWillTerminate(sender: NSNotification) {
        defer {
            NSNotificationCenter.defaultCenter().postNotificationName(UIApplicationWillTerminateNotification, object: self.uiApplication)
        }
        
        guard let application = self.uiApplication,
            let delegate = application.delegate else {
                return
        }
        
        delegate.applicationWillTerminate?(application)
    }
}

#endif
