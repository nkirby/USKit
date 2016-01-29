// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
    
public enum UIEventType : Int {
    case Touches
    case Motion
    case RemoteControl
    case Presses
}

public enum UIEventSubtype : Int {
    case None
    case MotionShake
    case RemoteControlPlay
    case RemoteControlPause
    case RemoteControlStop
    case RemoteControlTogglePlayPause
    case RemoteControlNextTrack
    case RemoteControlPreviousTrack
    case RemoteControlBeginSeekingBackward
    case RemoteControlEndSeekingBackward
    case RemoteControlBeginSeekingForward
    case RemoteControlEndSeekingForward
}

public class UIEvent: NSObject {
    public let pointerEvent: NSEvent
    private(set) public var type = UIEventType.Touches
    private(set) public var subtype = UIEventSubtype.None

    private let _touches: Set<UITouch>?
    
    public init(pointerEvent: NSEvent) {
        self.pointerEvent = pointerEvent
        
        let touch = UITouch(pointerEvent: pointerEvent)
        self._touches = [touch]
        
        super.init()
    }
    
    public func allTouches() -> Set<UITouch>? {
        return self._touches
    }
    
    public func touchesForView(view: NSView) -> Set<UITouch>? {
        USUnimplemented()
    }
    
    public func touchesForWindow(window: UIWindow) -> Set<UITouch>? {
        USUnimplemented()
    }
    
    public func touchesForGestureRecognizer(recognizer: UIGestureRecognizer) -> Set<UITouch>? {
        USUnimplemented()
    }
    
}

#endif
