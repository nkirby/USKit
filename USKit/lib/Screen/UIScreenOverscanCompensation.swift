// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public enum UIScreenOverscanCompensation : Int {
    case Scale
    case InsetBounds
    case None
    
    static var InsetApplicationFrame: UIScreenOverscanCompensation {
        return .None
    }
}

// =======================================================

extension UIScreen {
    public var overscanCompensation: UIScreenOverscanCompensation {
        USUnimplemented()
    }
    
    public var overscanCompensationInsets: UIEdgeInsets {
        get { return UIEdgeInsets.zero }
    }
}
    
#endif
