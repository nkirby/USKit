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
