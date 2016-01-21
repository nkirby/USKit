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

// =======================================================

extension CGRect {
    public func flippedWithin(parentFrame: CGRect) -> CGRect {
        return CGRect(x: self.origin.x, y: (parentFrame.size.height - self.origin.y) - self.size.height, width: self.size.width, height: self.size.height)
    }
}
