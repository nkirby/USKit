// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

extension NSValue {
    
// =======================================================
// MARK: - Value Creation
    
    class func valueWithCGPoint(point: CGPoint) -> NSValue {
        return NSValue(point: NSPointFromCGPoint(point))
    }
    
    class func valueWithCGRect(rect: CGRect) -> NSValue {
        return NSValue(rect: NSRectFromCGRect(rect))
    }
    
    class func valueWithCGSize(size: CGSize) -> NSValue {
        return NSValue(size: NSSizeFromCGSize(size))
    }
    
    class func valueWithUIEdgeInsets(insets: UIEdgeInsets) -> NSValue {
        USUnimplemented()
    }
    
    class func valueWithUIOffset(offset: UIOffset) -> NSValue {
        USUnimplemented()
    }

// =======================================================
// MARK: - Value Retrieval
    
    func CGPointValue() -> CGPoint {
        return NSPointToCGPoint(self.pointValue)
    }
    
    func CGRectValue() -> CGRect {
        return NSRectToCGRect(self.rectValue)
    }
    
    func CGSizeValue() -> CGSize {
        return NSSizeToCGSize(self.sizeValue)
    }
    
    func UIEdgeInsetsValue() -> UIEdgeInsets {
        USUnimplemented()
    }
    
    func UIOffsetValue() -> UIOffset {
        USUnimplemented()
    }
}
    
#endif
