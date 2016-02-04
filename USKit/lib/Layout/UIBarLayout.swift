// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public enum UIBarMetrics: Int {
    case Default
    case Compact
    case DefaultPrompt = 101
    case CompactPrompt
    case LandscapePhone
    case LandscapePhonePrompt
}
    
public enum UIBarPosition: Int {
    case Any
    case Bottom
    case Top
    case TopAttached
}
    
#endif