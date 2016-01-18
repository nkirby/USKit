// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public struct UIFloatRange {
    public var minimum: CGFloat
    public var maximum: CGFloat
    
    public init() {
        self.minimum = 0.0
        self.maximum = 0.0
    }
    
    public init(minimum: CGFloat, maximum: CGFloat) {
        self.minimum = minimum
        self.maximum = maximum
    }
}

// =======================================================

extension UIFloatRange: Equatable {}

public func == (lhs: UIFloatRange, rhs: UIFloatRange) -> Bool {
    return lhs.minimum == rhs.minimum && lhs.maximum == rhs.maximum
}

// =======================================================

public let UIFloatRangeZero = UIFloatRange()
public let UIFloatRangeInfinite = UIFloatRange(minimum: 0, maximum: CGFloat.infinity)
    
public func UIFloatRangeIsInfinite(floatRange: UIFloatRange) -> Bool {
    return (floatRange.maximum == CGFloat.infinity)
}

public func UIFloatRangeIsEqualToRange(range: UIFloatRange, _ otherRange: UIFloatRange) -> Bool {
    return range == otherRange
}

public func UIFloatRangeMake(minimum: CGFloat, _ maximum: CGFloat) -> UIFloatRange {
    return UIFloatRange(minimum: minimum, maximum: maximum)
}

#endif