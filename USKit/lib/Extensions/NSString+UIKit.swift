// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public func NSStringFromCGAffineTransform(transform: CGAffineTransform) -> String {
    return "[\(transform.a), \(transform.b), \(transform.c), \(transform.d), \(transform.tx), \(transform.ty)]"
}

public func NSStringFromCGPoint(point: CGPoint) -> String {
    let pointVal = NSPointFromCGPoint(point)
    return NSStringFromPoint(pointVal)
}

public func NSStringFromCGRect(rect: CGRect) -> String {
    let rectVal = NSRectFromCGRect(rect)
    return NSStringFromRect(rectVal)
}

public func NSStringFromCGSize(size: CGSize) -> String {
    let sizeVal = NSSizeFromCGSize(size)
    return NSStringFromSize(sizeVal);
}

public func NSStringFromUIEdgeInsets(insets: UIEdgeInsets) -> String {
    return "{\(insets.top), \(insets.left), \(insets.bottom), \(insets.right)}"
}

public func NSStringFromUIOffset(offset: UIOffset) -> String {
    return "{\(offset.horizontal), \(offset.vertical)}"
}

#endif