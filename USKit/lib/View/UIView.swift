// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

    private enum UIViewTouchState {
        case Up
        case Started
        case Moved
    }
    
public class UIView: NSView {
    private var _touchState = UIViewTouchState.Up
    
    private(set) public var backingView: NSView?
    public var shouldSendTouchEventsAsMouseEvents = true
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func mouseDown(theEvent: NSEvent) {
        super.mouseDown(theEvent)
        
        let event = UIEvent(pointerEvent: theEvent)
        let touches = event.allTouches() ?? []
        self.touchesBegan(touches, withEvent: event)
        self._touchState = .Started
    }

    public override func mouseUp(theEvent: NSEvent) {
        super.mouseUp(theEvent)
        
        let event = UIEvent(pointerEvent: theEvent)
        let touches = event.allTouches() ?? []
        self.touchesEnded(touches, withEvent: event)
        self._touchState = .Up
    }
    
    public override func mouseMoved(theEvent: NSEvent) {
        super.mouseMoved(theEvent)
    }
    
    public override func mouseDragged(theEvent: NSEvent) {
        let event = UIEvent(pointerEvent: theEvent)
        let touches = event.allTouches() ?? []
        self.touchesMoved(touches, withEvent: event)
    }
}
    
#endif
