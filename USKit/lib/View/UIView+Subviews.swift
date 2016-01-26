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
            view.backingView.frame = view.backingView.frame.flippedWithin(self.backingView.bounds)
            
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
        USUnimplemented()
    }
    
// =======================================================
// MARK: - View Identification
    
    public func viewWithTag(tag: Int) -> UIView? {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Converting Points
    
    public func convertPoint(point: CGPoint, toView view: UIView?) -> CGPoint {
        USUnimplemented()
    }
    
    public func convertPoint(point: CGPoint, fromView view: UIView?) -> CGPoint {
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