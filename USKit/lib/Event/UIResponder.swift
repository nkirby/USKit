// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
    
public typealias UIResponder = NSResponder
    
extension UIResponder {
    public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    public func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    public func touchesCancelled(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
    
    public func touchesEstimatedPropertiesUpdated(touches: Set<NSObject>) {
    }
}
    
#endif
