// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
    
// =======================================================

public class UIControl: UIView {
    public var state: UIControlState {
        get {
            var state = UIControlState.Normal
            if !self.enabled {
                state.unionInPlace(UIControlState.Disabled)
            }
            if self.highlighted {
                state.unionInPlace(UIControlState.Highlighted)
            }
            if self.selected {
                state.unionInPlace(UIControlState.Selected)
            }
            return state
        }
    }
    
    private(set) public var tracking = false
    private(set) public var touchInside = false

    public var enabled = false {
        didSet {
            if oldValue != self.enabled {
                self.userInteractionEnabled = true
                self.notifyStateChange()
            }
        }
    }
    
    public var selected = false {
        didSet {
            if oldValue != self.selected {
                self.notifyStateChange()
            }
        }
    }
    
    public var highlighted = false {
        didSet {
            if oldValue != self.selected {
                self.notifyStateChange()
            }
        }
    }
    
    public var contentVerticalAlignment = UIControlContentVerticalAlignment.Top
    public var contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left

    private var _actions = [USControlAction]()

// =======================================================
// MARK: - Actions

    public func sendAction(action: Selector, to target: AnyObject?, forEvent event: UIEvent?) {
        NSApp.sendAction(action, to: target, from: self)
    }
    
    public func sendActionsForControlEvents(controlEvents: UIControlEvents) {
        for controlAction in self._actions {
            if controlAction.controlEvents.contains(controlEvents) {
                self.sendAction(controlAction.action, to: controlAction.target, forEvent: nil)
            }
        }
    }

    public func addTarget(target: NSObject?, action: Selector, forControlEvents controlEvents: UIControlEvents) {
        let action = USControlAction(action: action, target: target, controlEvents: controlEvents)
        self._actions.append(action)
    }

    public func removeTarget(target: NSObject?, action: Selector, forControlEvents controlEvents: UIControlEvents) {
        let action = USControlAction(action: action, target: target, controlEvents: controlEvents)
        let actions = self._actions.filter { ownedAction in
            return action != ownedAction
        }
        
        self._actions = actions
    }
    
    public func actionsForTarget(target: NSObject?, forControlEvent controlEvent: UIControlEvents) -> [String]? {
        let selectorNames: [String] = self._actions.flatMap { action in
            if action.target == target && action.controlEvents == controlEvent {
                return NSStringFromSelector(action.action)
            }
            
            return nil
        }
        
        if selectorNames.count > 0 {
            return selectorNames
        } else {
            return nil
        }
    }
    
    public func allTargets() -> Set<NSObject> {
        return Set(self._actions.flatMap { action in
            return action.target
        })
    }
    
    public func allControlEvents() -> UIControlEvents {
        USUnimplemented()
    }

// =======================================================
// MARK: - Touches
    
    public func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        return true
    }
    
    public func continueTrackingWithTouch(touch: UITouch, withEvent event: UIEvent?) -> Bool {
        return true
    }

    public func endTrackingWithTouch(touch: UITouch?, withEvent event: UIEvent?) {
    }
    
    public func cancelTrackingWithEvent(event: UIEvent?) {
    }
    
// =======================================================
// MARK: - Changes
    
    private func notifyStateChange() {
        self.setNeedsDisplay()
        self.setNeedsLayout()
    }
    
// =======================================================
// MARK: - Tracking
    
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        assert(touches.count > 0)
        
        // Safe to not call super, but lets do so for now.
        super.touchesBegan(touches, withEvent: event)

        self.touchInside = true
        
        let touch = touches.first!
        self.tracking = self.beginTrackingWithTouch(touch, withEvent: event)
        self.highlighted = true
        
        if self.tracking {
            var events = UIControlEvents.TouchDown
            if touch.tapCount > 1 {
                events.unionInPlace(.TouchDownRepeat)
            }
            
            self.sendActionsForControlEvents(events)
        }
    }
    
    public override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        assert(touches.count > 0)
        
    }
    
    public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        assert(touches.count > 0)
                
    }
    
    public override func touchesCancelled(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesCancelled(touches, withEvent: event)
        
        self.highlighted = false
        self.touchInside = false
        
        if self.tracking {
            self.cancelTrackingWithEvent(event)
            self.sendActionsForControlEvents(.TouchCancel)
        }
        
        self.tracking = false
    }
}

#endif
