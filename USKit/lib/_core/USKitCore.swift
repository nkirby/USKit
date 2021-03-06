// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

import Foundation

// =======================================================
// From: https://github.com/apple/swift-corelibs-foundation/blob/master/Foundation/NSObjCRuntime.swift#L79

@noreturn public func USUnimplemented(fn: String = __FUNCTION__, file: StaticString = __FILE__, line: UInt = __LINE__) {
    fatalError("\(fn) is not yet implemented", file: file, line: line)
}

public func USLog(string: String) {
    NSLog(string)
}

// =======================================================

extension CGRect {
    internal var integral: CGRect {
        return CGRectIntegral(self)
    }
    internal func centerPoint() -> CGPoint {
        return CGPoint(x: CGRectGetMidX(self), y: CGRectGetMidY(self))
    }
    internal func centeredOn(point point: CGPoint) -> CGRect {
        return CGRect(x: point.x - (self.width / 2), y: point.y - (self.height / 2), width: point.x + (self.width / 2), height: point.y + (self.width / 2)).integral
    }
}
