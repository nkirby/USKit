// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

extension UIView {
    public func sizeThatFits(size: CGSize) -> CGSize {
        USUnimplemented()
    }
    
    public func sizeToFit() {
        USUnimplemented()
    }
    
    public func setNeedsLayout() {
    }
    
    public func setNeedsDisplay() {
    }
}
    
#endif