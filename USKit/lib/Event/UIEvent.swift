// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public class UIEvent: NSEvent {    
    public func allTouches() -> Set<UITouch>? {
        USUnimplemented()
    }
    
    public func touchesForView(view: NSView) -> Set<UITouch>? {
        USUnimplemented()
    }
    
    public func touchesForWindow(window: UIWindow) -> Set<UITouch>? {
        USUnimplemented()
    }
    
    
}

#endif
