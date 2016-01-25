// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

extension UIView {
    
// =======================================================
// MARK: - Drawing & Updating

    public func tintColorDidChange() {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Printing
    
    public func viewPrintFormatter() -> UIViewPrintFormatter {
        USUnimplemented()
    }
    
    public func drawRect(rect: CGRect, forViewPrintFormatter formatter: UIViewPrintFormatter) {
        USUnimplemented()
    }

// =======================================================
// MARK: - Gesture Recogniers
    
    public func addGestureRecognizer(gestureRecognizer: UIGestureRecognizer) {
        USUnimplemented()
    }
    
    public func removeGestureRecognizer(gestureRecognizer: UIGestureRecognizer) {
        USUnimplemented()
    }
    
    public func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Snapshotting
    
    public func snapshotViewAfterScreenUpdates(afterUpdates: Bool) -> UIView {
        USUnimplemented()
    }
    
    public func resizableSnapshotViewFromRect(rect: CGRect, afterScreenUpdates afterUpdates: Bool, withCapInsets capInsets: UIEdgeInsets) -> UIView {
        USUnimplemented()
    }
    
    public func drawViewHierarchyInRect(rect: CGRect, afterScreenUpdates afterUpdates: Bool) -> Bool {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Editing
    
    public func endEditing(force: Bool) -> Bool {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Focus
    
    public func canBecomeFocused() -> Bool {
        USUnimplemented()
    }
    
    public class func inheritedAnimationDuration() -> NSTimeInterval {
        USUnimplemented()
    }
}
    
#endif
