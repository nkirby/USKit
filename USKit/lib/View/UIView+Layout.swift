// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

extension UIView {
    
// =======================================================
// MARK: - Sizing
    
    public func sizeThatFits(size: CGSize) -> CGSize {
        USUnimplemented()
    }
    
    public func sizeToFit() {
        USUnimplemented()
    }

// =======================================================
// MARK: - Laying Out Subviews
    
    public func layoutSubviews() {
        USUnimplemented()
    }
    
    public func setNeedsLayout() {
        USUnimplemented()
    }
    
    public func layoutIfNeeded() {
        USUnimplemented()
    }
    
    public class func requiresConstraintBasedLayout() -> Bool {
        return false
    }

// =======================================================
// MARK: - Interface Direction
    
    public class func userInterfaceLayoutDirectionForSemanticContentAttribute(attribute: UISemanticContentAttribute) -> UIUserInterfaceLayoutDirection {
        USUnimplemented()
    }

// =======================================================
// MARK: - Drawing & Updating
    
    public func drawRect(rect: CGRect) {
        USUnimplemented()
    }
    
    public func setNeedsDisplay() {
        USUnimplemented()
    }
    
    public func setNeedsDisplayInRect(rect: CGRect) {
        USUnimplemented()
    }

// =======================================================
// MARK: - Content Margins
    
    public func layoutMarginsDidChange() {
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
