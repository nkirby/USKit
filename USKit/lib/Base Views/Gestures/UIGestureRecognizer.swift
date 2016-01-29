// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

    public typealias UIPress = NSObject
    public typealias UIPressesEvent = UIEvent
    
    public protocol UIGestureRecognizerDelegate: NSObjectProtocol {
    }
    
    public enum UIGestureRecognizerState : Int {
        case Possible
        case Began
        case Changed
        case Ended
        case Cancelled
        case Failed
        static var Recognized = UIGestureRecognizerState.Ended
    }

// =======================================================

public class UIGestureRecognizer: NSObject {
    internal(set) public var state: UIGestureRecognizerState = .Possible
    internal(set) public var view: UIView? = nil {
        didSet {
            self.reset()
        }
    }
    
    public var enabled = true
    
    public var cancelsTouchesInView = true
    public var delaysTouchesBegan = false
    public var delaysTouchesEnded = true
    
    public weak var delegate: UIGestureRecognizerDelegate?
    
    public init(target: AnyObject?, action: Selector) {
        super.init()
        
    }

// =======================================================
// MARK: - Target - Action
    
    public func addTarget(target: AnyObject, action: Selector) {
        USUnimplemented()
    }
    
    public func removeTarget(target: AnyObject?, action: Selector) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Events
    
    public func locationInView(view: UIView?) -> CGPoint {
        USUnimplemented()
    }
    
    public func locationOfTouch(touchIndex: Int, inView view: UIView?) -> CGPoint {
        USUnimplemented()
    }
    
    public func numberOfTouches() -> Int {
        USUnimplemented()
    }
    
    public func requireGestureRecognizerToFail(otherGestureRecognizer: UIGestureRecognizer) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Subclassing
    
    public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    public func touchesCancelled(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    public func reset() {
    }
    
    public func ignoreTouch(touch: UITouch, forEvent event: UIEvent) {
    }
    
    public func canBePreventedByGestureRecognizer(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func canPreventGestureRecognizer(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func shouldRequireFailureOfGestureRecognizer(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func shouldBeRequiredToFailByGestureRecognizer(gestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
    
    public func ignorePress(press: UIPress, forEvent event: UIEvent) {
    }
    
    public func pressesBegan(press: Set<UIPress>, withEvent event: UIPressesEvent?) {
    }
    
    public func pressesChanged(press: Set<UIPress>, withEvent event: UIPressesEvent?) {
    }
    
    public func pressesEnded(press: Set<UIPress>, withEvent event: UIPressesEvent?) {
    }

    public func pressesCancelled(press: Set<UIPress>, withEvent event: UIPressesEvent?) {
    }
}

#endif