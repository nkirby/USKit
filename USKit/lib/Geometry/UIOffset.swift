// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public struct UIOffset {
    public let horizontal: CGFloat
    public let vertical: CGFloat
    
    public static let zero = UIOffset(horizontal: 0.0, vertical: 0.0)
    
    public init(horizontal: CGFloat, vertical: CGFloat) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
}

extension UIOffset: Equatable {}

public func == (lhs: UIOffset, rhs: UIOffset) -> Bool {
    return lhs.horizontal == rhs.horizontal && lhs.vertical == rhs.vertical
}
    
// =======================================================

public func UIOffsetEqualToOffset(offset1: UIOffset, _ offset2: UIOffset) -> Bool {
    return offset1 == offset2
}

public var UIOffsetZero: UIOffset {
    return UIOffset.zero
}

#endif