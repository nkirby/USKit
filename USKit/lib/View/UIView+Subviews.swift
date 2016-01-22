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
// MARK: - View Related Changes
    
    public func didAddSubview(subview: UIView) {
    }
    
    public func willRemoveSubview(subview: UIView) {
    }
    
    public func willMoveToSuperview(newSuperview: UIView) {
    }
    
    public func didMoveToSuperview() {
    }
    
    public func willMoveToWindow(window: UIWindow?) {
    }
    
    public func didMoveToWindow() {
    }
}
    
#endif