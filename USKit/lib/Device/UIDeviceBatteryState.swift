// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public enum UIDeviceBatteryState: Int {
    case Unknown
    case Unplugged
    case Charging
    case Full
}

#endif