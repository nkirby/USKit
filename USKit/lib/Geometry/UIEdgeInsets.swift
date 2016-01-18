// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public struct UIEdgeInsets {
    public let top: CGFloat
    public let left: CGFloat
    public let bottom: CGFloat
    public let right: CGFloat
    
    public static let zero = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    
    public init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
    
    public func insetRect(rect: CGRect) -> CGRect {
        var insetRect = rect
        insetRect.origin.x = rect.origin.x + self.left
        insetRect.origin.y = rect.origin.y + self.top
        insetRect.size.width = rect.size.width - (self.left + self.right)
        insetRect.size.height = rect.size.height - (self.top + self.bottom)
        return insetRect
    }
}

extension UIEdgeInsets: Equatable {}

public func == (lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> Bool {
    return lhs.top == rhs.top && lhs.left == rhs.left && lhs.bottom == rhs.bottom && lhs.right == rhs.right
}

// =======================================================

public func UIEdgeInsetsMake(top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> UIEdgeInsets {
    return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
}

public func UIEdgeInsetsInsetRect(rect: CGRect, _ insets: UIEdgeInsets) -> CGRect {
    return insets.insetRect(rect)
}

public func UIEdgeInsetsEqualToEdgeInsets(insets1: UIEdgeInsets, _ insets2: UIEdgeInsets) -> Bool {
    return insets1 == insets2;
}

public var UIEdgeInsetsZero: UIEdgeInsets {
    return UIEdgeInsets.zero
}

#endif
