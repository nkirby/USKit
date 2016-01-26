// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

extension UIView {

// =======================================================
// MARK: - Subviews
    
    public func addSubview(view: UIView) {
        if !self.subviews.contains(view) {
            // We're about to change
            view.willMoveToWindow(self.window)
            view.willMoveToSuperview(self)
            
            // Alert the current superview
            if let superview = view.superview, let idx = superview.subviews.indexOf(view) {
                superview.willRemoveSubview(view)
                superview.subviews.removeAtIndex(idx)
                view.backingView.removeFromSuperview()
            }
            
            // Adjust the frame
//            view.backingView.frame = view.backingView.frame.flippedWithin(self.backingView.bounds)
            
            // Insert the subview
            self.subviews.append(view)
            self.backingView.addSubview(view.backingView)
            
            // We've moved
            view.didMoveToSuperview()
            view.didMoveToWindow()
            self.didAddSubview(view)
        }
    }
    
    public func bringSubviewToFront(subview: UIView) {
        USUnimplemented()
    }
    
    public func sendSubviewToBack(subview: UIView) {
        USUnimplemented()
    }
    
    public func removeFromSuperview() {
        USUnimplemented()
    }
    
    public func insertSubview(subview: UIView, atIndex index: Int) {
        USUnimplemented()
    }
    
    public func insertSubview(subview: UIView, aboveSubview: UIView) {
        USUnimplemented()
    }
    
    public func insertSubview(subview: UIView, belowSubview: UIView) {
        USUnimplemented()
    }
    
    public func exchangeSubviewAtIndex(index1: Int, withSubviewAtIndex index2: Int) {
        USUnimplemented()
    }
    
    public func isDescendantOfView(view: UIView) -> Bool {
        return self.backingView.isDescendantOf(view.backingView)
    }
    
// =======================================================
// MARK: - View Identification
    
    public func viewWithTag(tag: Int) -> UIView? {
        if self.tag == tag {
            return self
        }
        
        for subview in self.subviews {
            if subview.tag == tag {
                return subview
            }
        }
        
        return nil
    }
    
// =======================================================
// MARK: - Converting Points
    
/*
A nasty sideffect of the CGRect frame/bounds trickery we're doing is that dropping to the
backingView's convertPoint: methods won't work, as the backingView's frame is the actual bottom-left
origin coordinate system, whereas UIView, et al, are expecting the top-left origin coordinate system. 

This means we have to calculate the difference ourselves. The result, below, isn't pretty. It needs
testing and refactoring.
*/
    
    public func convertPoint(point: CGPoint, toView view: UIView?) -> CGPoint {
        if self == view {
            return point
        }
        
        if let otherView = view {
            if self.isDescendantOfView(otherView) {
                var offset = point
                if otherView.subviews.contains(self) {
                    offset.x = point.x + self.frame.origin.x
                    offset.y = point.y + self.frame.origin.y
                    return offset
                } else {
                    for subview in otherView.subviews {
                        if self.isDescendantOfView(subview) {
                            return subview.convertPoint(point, toView: otherView)
                        }
                    }
                }
            } else {
                var offset = point
                if self.subviews.contains(otherView) {
                    offset.x = point.x - otherView.frame.origin.x
                    offset.y = point.x - otherView.frame.origin.y
                    return offset
                } else {
                    for subview in self.subviews {
                        if otherView.isDescendantOfView(subview) {
                            return subview.convertPoint(point, toView: otherView)
                        }
                    }
                }
            }
        }
        
        // TODO: Implement UIWindow fallback
        return CGPoint.zero
    }
    
    public func convertPoint(point: CGPoint, fromView view: UIView?) -> CGPoint {
        if self == view {
            return point
        }

        if let otherView = view {
            if self.isDescendantOfView(otherView) {
                var offset = point
                if otherView.subviews.contains(self) {
                    offset.x = point.x - self.frame.origin.x
                    offset.y = point.y - self.frame.origin.y
                    return offset
                } else {
                    for subview in otherView.subviews {
                        if self.isDescendantOfView(subview) {
                            return subview.convertPoint(point, fromView: otherView)
                        }
                    }
                }
            } else {
                var offset = point
                if self.subviews.contains(otherView) {
                    offset.x = point.x + otherView.frame.origin.x
                    offset.y = point.x + otherView.frame.origin.y
                    return offset
                } else {
                    for subview in self.subviews {
                        if otherView.isDescendantOfView(subview) {
                            return subview.convertPoint(point, fromView: otherView)
                        }
                    }
                }
            }
        }
        
        // TODO: Implement UIWindow fallback
        USUnimplemented()
    }
    
    public func convertRect(rect: CGRect, toView view: UIView?) -> CGRect {
        USUnimplemented()
    }
    
    public func convertRect(rect: CGRect, fromView view: UIView?) -> CGRect {
        USUnimplemented()
    }

// =======================================================
// MARK: - Hit Tests
    
    public func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        USUnimplemented()
    }
    
    public func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        USUnimplemented()
    }
}
    
#endif