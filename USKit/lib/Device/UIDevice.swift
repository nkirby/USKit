// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================
    
public final class UIDevice: NSObject {
    
// =======================================================
// MARK: - Singleton
    
    private static let _currentDevice = UIDevice()
    public static func currentDevice() -> UIDevice {
        return self._currentDevice
    }
    
// =======================================================
// MARK: - Features
    
    public let multitaskingSupported = true
    
// =======================================================
// MARK: - Info
    
    public let name: String
    public let systemName: String
    public let systemVersion: String
    public let model: String
    public let localizedModel: String
    public let userInterfaceIdiom = UIUserInterfaceIdiom.Unspecified
    public let identifierForVendor: NSUUID?
    
// =======================================================
// MARK: - Orientation
    
    public let orientation = UIInterfaceOrientation.LandscapeLeft
    public var generatesDeviceOrientationNotifications: Bool {
        get { return false }
        set { }
    }

// =======================================================
// MARK: - Battery Level
    
    public var batteryLevel: Float {
        return UIDeviceBatteryStateUnknown
    }
    
    public var batteryMonitoringEnabled: Bool {
        get { return false }
        set { }
    }
    public var batteryState = UIDeviceBatteryState.Unknown

// =======================================================
// MARK: - Proximity
    
    public var proximityMonitoringEnabled: Bool {
        get { return false }
        set { }
    }
    
    public var proximityState = false

// =======================================================
// MARK: - INput Clicks
    
    public var playInputClick: Bool {
        get { return false }
        set { }
    }
    
// =======================================================
// MARK: - Init, etc...
    
    private override init() {
        self.name = NSHost.currentHost().localizedName ?? ""
        self.systemName = "NSMACHOperatingSystem"
        self.systemVersion = NSProcessInfo.processInfo().operatingSystemVersionString
        
        // TODO: Implement
        self.model = ""
        self.localizedModel = ""
        self.identifierForVendor = nil
    }
    
// =======================================================
// MARK: - Orientation Notifications
    
    public func beginGeneratingDeviceOrientationNotifications() {
        NSLog("USKit cannot generate device orientation notifications on Mac")
    }
    
    public func endGeneratingDeviceOrientationNotifications() {
        NSLog("USKit cannot generate device orientation notifications on Mac")
    }
}

#endif
