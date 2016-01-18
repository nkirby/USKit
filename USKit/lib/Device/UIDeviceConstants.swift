// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================
// MARK: - Battery State
    
public let UIDeviceBatteryStateUnknown: Float = -1.0

// =======================================================
// MARK: - Notifications
    
public let UIDeviceBatteryLevelDidChangeNotification = "UIDeviceBatteryLevelDidChangeNotification"
public let UIDeviceBatteryStateDidChangeNotification = "UIDeviceBatteryStateDidChangeNotification"
public let UIDeviceOrientationDidChangeNotification = "UIDeviceOrientationDidChangeNotification"
public let UIDeviceProximityStateDidChangeNotification = "UIDeviceProximityStateDidChangeNotification"
    
#endif
