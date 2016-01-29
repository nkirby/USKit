// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public enum UIViewContentMode: Int {
    case ScaleToFill
    case ScaleAspectFit
    case ScaleAspectFill
    case Redraw
    case Center
    case Top
    case Bottom
    case Left
    case Right
    case TopLeft
    case TopRight
    case BottomLeft
    case BottomRight
}

public enum UIViewTintAdjustmentMode : Int {
    case Automatic
    case Normal
    case Dimmed
}
#endif
