// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public struct UIViewAutoresizing : OptionSetType {
    public var rawValue: UInt
    public var autoresizingMask: NSAutoresizingMaskOptions {
        return NSAutoresizingMaskOptions(rawValue: self.rawValue)
    }
    
    public static var None = UIViewAutoresizing(rawValue: NSAutoresizingMaskOptions.ViewNotSizable.rawValue)
    public static var FlexibleLeftMargin = UIViewAutoresizing(rawValue: NSAutoresizingMaskOptions.ViewMinXMargin.rawValue)
    public static var FlexibleWidth = UIViewAutoresizing(rawValue: NSAutoresizingMaskOptions.ViewWidthSizable.rawValue)
    public static var FlexibleRightMargin = UIViewAutoresizing(rawValue: NSAutoresizingMaskOptions.ViewMaxXMargin.rawValue)
    public static var FlexibleTopMargin = UIViewAutoresizing(rawValue: NSAutoresizingMaskOptions.ViewMinYMargin.rawValue)
    public static var FlexibleHeight = UIViewAutoresizing(rawValue: NSAutoresizingMaskOptions.ViewHeightSizable.rawValue)
    public static var FlexibleBottomMargin = UIViewAutoresizing(rawValue: NSAutoresizingMaskOptions.ViewMaxYMargin.rawValue)
    
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    public init(maskOptions: NSAutoresizingMaskOptions) {
        self.rawValue = maskOptions.rawValue
    }
}

extension NSAutoresizingMaskOptions {
    public init(autoresizingMask: UIViewAutoresizing) {
        self.init(rawValue: autoresizingMask.rawValue)
    }
}

#endif
