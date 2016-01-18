// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public enum UIInterfaceOrientation: Int {
    case Unknown
    case Portrait
    case PortraitUpsideDown
    case LandscapeLeft
    case LandscapeRight
}

public func UIInterfaceOrientationIsPortrait(orientation: UIInterfaceOrientation) -> Bool {
    switch orientation {
    case .Portrait, .PortraitUpsideDown:
        return true
        
    default:
        return false
    }
}

public func UIInterfaceOrientationisLandscape(orientation: UIInterfaceOrientation) -> Bool {
    switch orientation {
    case .LandscapeLeft, .LandscapeRight:
        return true
        
    default:
        return false
    }
}

#endif