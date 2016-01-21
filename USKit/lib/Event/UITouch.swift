// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public enum UITouchType : Int {
    case Direct
    case Indirect
    case Stylus
}

public enum UITouchPhase : Int {
    case Began
    case Moved
    case Stationary
    case Ended
    case Cancelled
}

// =======================================================
    
public class UITouch: NSObject {
    public let view: UIView? = nil
    public let window: UIWindow?
    public let majorRadius: CGFloat = 0.0
    public let majorRadiusToTolerance: CGFloat = 0.0
    
    public let tapCount = 1
    public let timestamp: NSTimeInterval = 0.0
    
    public let type = UITouchType.Direct
    public let phase = UITouchPhase.Began
    public let force: CGFloat = 0.0
    public let maximumPossibleForce: CGFloat = 0.0
    public let altitudeAngle: CGFloat = 0.0
    
    public let gestureRecognizers: [UIGestureRecognizer]? = nil
    
    internal init(pointerEvent: NSEvent) {
        self.window = pointerEvent.window
        
        super.init()
    }
    
    func locationInView(view: UIView?) -> CGPoint {
        USUnimplemented()
    }
    
    func previousLocationInView(view: UIView?) -> CGPoint {
        USUnimplemented()
    }
    
    func preciseLocationInView(view: UIView?) -> CGPoint {
        return self.locationInView(view)
    }
    
    func precisePreviousLocationInView(view: UIView?) -> CGPoint {
        return self.previousLocationInView(view)
    }
    
    func azimuthAngleInView(view: UIView?) -> CGFloat {
        USUnimplemented()
    }
    
    func azimuthUnitVectorInView(view: UIView?) -> CGVector {
        USUnimplemented()
    }
}

#endif
