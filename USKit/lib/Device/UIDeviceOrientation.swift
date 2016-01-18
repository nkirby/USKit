// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public enum UIDeviceOrientation : Int {
    case Unknown
    case Portrait
    case PortraitUpsideDown
    case LandscapeLeft
    case LandscapeRight
    case FaceUp
    case FaceDown
}

public let UIDeviceOrientationUnknown = UIDeviceOrientation.Unknown
public let UIDeviceOrientationPortrai = UIDeviceOrientation.Portrait
public let UIDeviceOrientationPortraitUpsideDown = UIDeviceOrientation.PortraitUpsideDown
public let UIDeviceOrientationLandscapeLeft = UIDeviceOrientation.LandscapeLeft
public let UIDeviceOrientationLandscapeRight = UIDeviceOrientation.LandscapeRight
public let UIDeviceOrientationFaceUp = UIDeviceOrientation.FaceUp
public let UIDeviceOrientationFaceDown = UIDeviceOrientation.FaceDown
    
public func UIDeviceOrientationIsPortrait(orientation: UIDeviceOrientation) -> Bool {
    switch orientation {
    case .Portrait, .PortraitUpsideDown:
        return true
        
    default:
        return false
    }
}

public func UIDeviceOrientaitonIsLandscape(orientation: UIDeviceOrientation) -> Bool {
    switch orientation {
    case .LandscapeRight, .LandscapeLeft:
        return true
        
    default:
        return false
    }
}

#endif