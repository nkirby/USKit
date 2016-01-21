// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public class UIView: NSView {
    private(set) public var backingView: NSView?
    public var shouldSendTouchEventsAsMouseEvents = true
    
    public override func mouseDown(theEvent: NSEvent) {
        self.touchesBegan([], withEvent: nil)
    }

}
    
#endif
