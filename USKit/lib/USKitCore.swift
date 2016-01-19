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

internal final class Dispatch {
    internal static func background(block: dispatch_block_t) {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), block)
    }
    
    internal static func background(after: Double, block: dispatch_block_t) {
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, Int64(after * Double(NSEC_PER_SEC))),
            dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0),
            block
        )
    }
    
    internal static func main(block: dispatch_block_t) {
        dispatch_async(dispatch_get_main_queue(), block)
    }
    
    internal static func main(after: Double, block: dispatch_block_t) {
        dispatch_after(
            dispatch_time(DISPATCH_TIME_NOW, Int64(after * Double(NSEC_PER_SEC))),
            dispatch_get_main_queue(),
            block
        )
    }
}
