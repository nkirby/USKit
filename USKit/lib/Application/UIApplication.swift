// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

    // Temp
    public typealias UIUserNotificationSettings = NSObject
    public typealias UIWindow = NSWindow
    public typealias UIEvent = NSEvent
    public typealias UILocalNotification = NSObject
    public typealias UIBackgroundTaskIdentifier = NSObject
    public typealias UIApplicationShortcutItem = NSObject
    
    public enum UIApplicationState: Int {
        case Active
        case Inactive
        case Background
    }
    
    public let UIApplicationStateActive = UIApplicationState.Active
    public let UIApplicationStateInactive = UIApplicationState.Inactive
    public let UIApplicationStateBackground = UIApplicationState.Background
    
    public enum UIBackgroundRefreshStatus: Int {
        case Restricted
        case Denied
        case Available
    }
    
    public let UIBackgroundRefreshStatusRestricted = UIBackgroundRefreshStatus.Restricted
    public let UIBackgroundRefreshStatusDenied = UIBackgroundRefreshStatus.Denied
    public let UIBackgroundRefreshStatusAvailable = UIBackgroundRefreshStatus.Available
    
    public enum UIUserInterfaceLayoutDirection: Int {
        case LeftToRight
        case RightToLeft
    }

    public let UIUserInterfaceLayoutDirectionLeftToRight = UIUserInterfaceLayoutDirection.LeftToRight
    public let UIUserInterfaceLayoutDirectionRightToLefft = UIUserInterfaceLayoutDirection.RightToLeft
    
    @objc public protocol UIApplicationDelegate: NSObjectProtocol {
        optional func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
        optional func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    }
    
// =======================================================

public class UIApplication: NSObject {
    private(set) public var delegate: UIApplicationDelegate?
    
    public var keyWindow: UIWindow? {
        get { return nil }
    }
    
    public var windows: [UIWindow] {
        get { return [] }
    }
    
    public var applicationSupportsShakeToEdit: Bool {
        get { return false }
        set { }
    }
    
    public var scheduledLocalNotifications: [UILocalNotification]? {
        get { return nil }
    }
    
    public var applicationState: UIApplicationState {
        get { return .Active }
    }
    
    public var backgroundTimeRemaining: NSTimeInterval {
        get { return 0.0 }
    }
    
    public var backgroundRefreshStatus: UIBackgroundRefreshStatus {
        get { return .Available }
    }
    
    public var idleTimerDisabled: Bool {
        get { return false }
        set { }
    }
    
    public static var shortcutItems: [UIApplicationShortcutItem]? {
        get { return nil }
        set { }
    }
    
    public var protectedDataAvailable = false
    
    public var statusBarFrame = CGRect.zero
    public var networkActivityIndicatorVisible: Bool {
        get { return false }
        set { }
    }
    
    public var applicationIconBadgeNumber: Int {
        get { return 0 }
        set { }
    }
    
    public var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        get { return .LeftToRight }
    }
    
    public var preferredContentSizeCategory: String {
        get { return "" }
    }
    
    public var statusBarOrientationAnimationDuration: NSTimeInterval = 0.0
    
// =======================================================
// MARK: - Init, etc...

    public static func sharedApplication() -> UIApplication {
        return USApplication.sharedApplication().uiApplication!
    }

    internal init(delegate: UIApplicationDelegate) {
        self.delegate = delegate
        super.init()
    }
    
    deinit {
        self.delegate = nil
    }
    
// =======================================================
// MARK: - Events
    
    public func sendEvent(event: UIEvent) {
        USUnimplemented()
    }
    
    public func sendAction(action: Selector, to target: AnyObject?, from sender: AnyObject?, forEvent event: UIEvent?) -> Bool {
        USUnimplemented()
    }
    
    public func beginIgnoringInteractionEvents() {
        USUnimplemented()
    }
    
    public func endIgnoringInteractionEvents() {
        USUnimplemented()
    }
    
    public func isIgnoringInteractionEvents() -> Bool {
        return false
    }
    
// =======================================================
// MARK: - URLs
    
    public func openURL(url: NSURL) -> Bool {
        return NSWorkspace.sharedWorkspace().openURL(url)
    }
    
    public func canOpenURL(url: NSURL) -> Bool {
        return true
    }
    
// =======================================================
// MARK: - User Notifications
    
    public func registerUserNotificationSettings(settings: UIUserNotificationSettings) {
        USUnimplemented()
    }
    
    public func currentUserNotificationSettings() -> UIUserNotificationSettings? {
        return nil
    }
    
// =======================================================
// MARK: - Remote Notifications
    
    public func registerForRemoteNotifications() {
    }
    
    public func unregisterForRemoteNotifications() {
    }
    
    public func isRegisteredForRemoteNotifications() -> Bool {
        return false
    }
    
// =======================================================
// MARK: - Local Notifications
    
    public func scheduleLocalNotification(notification: UILocalNotification) {
    }
    
    public func presentLocalNotificationNow(notification: UILocalNotification) {
    }
    
    public func cancelLocalNotification(notification: UILocalNotification) {
    }
    
    public func cancelAllLocalNotifications() {
    }
    
// =======================================================
// MARK: - Background Refresh
    
    public func setMinimumBackgroundFetchInterval(interval: NSTimeInterval) {
    }
    
    public func beginBackgroundTaskWithName(name: String?, expirationHandler handler: (() -> Void)?) -> UIBackgroundTaskIdentifier {
        USUnimplemented()
    }
    
    public func beginBackgroundTaskWithExpirationHandler(handler: (() -> Void)?) -> UIBackgroundTaskIdentifier {
        USUnimplemented()
    }
    
    public func endBackgroundtask(identifier: UIBackgroundTaskIdentifier) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - State Restoration
    
    public func extendStateRestoration() {
    }
    
    public func completeStateRestoration() {
    }
    
    public func ignoreSnapshotOnNextApplicationLaunch() {
    }
    
    public class func registerObjectForStateRestoration(object: NSObject, restorationIdentifier identifier: String) {
    }
    
// =======================================================
// MARK: - Remote Control Events
    
    public func beginReceivingRemoteControlEvents() {
    }
    
    public func endReceivingRemoteControlEvents() {
    }
}

#endif
