// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
    
public typealias UIFont = NSFont

public extension UIFont {
    public class func familyNames() -> [String] {
        USUnimplemented()
    }
    
    public class func fontNamesForFamilyName(familyName: String) -> [String] {
        USUnimplemented()
    }
    
    public class func italicSystemFontOfSize(size: CGFloat) -> UIFont {
        USUnimplemented()
    }
    
    public func fontWithSize(fontSize: CGFloat) -> UIFont {
        return UIFont(name: self.fontName, size: fontSize)!
    }
    
    @nonobjc var lineHeight: CGFloat {
        return -1.0
    }
//    public func lineHeight() -> CGFloat {
//        return -1.0
//    }
}

#endif
