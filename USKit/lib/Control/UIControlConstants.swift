// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================
    
public struct UIControlEvents : OptionSetType {
    public var rawValue: UInt
    
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    public static var TouchDown = UIControlEvents(rawValue: 1 << 0)
    public static var TouchDownRepeat = UIControlEvents(rawValue: 1 << 1)
    public static var TouchDragInside = UIControlEvents(rawValue: 1 << 2)
    public static var TouchDragOutside = UIControlEvents(rawValue: 1 << 3)
    public static var TouchDragEnter = UIControlEvents(rawValue: 1 << 4)
    public static var TouchDragExit = UIControlEvents(rawValue: 1 << 5)
    public static var TouchUpInside = UIControlEvents(rawValue: 1 << 6)
    public static var TouchUpOutside = UIControlEvents(rawValue: 1 << 7)
    public static var TouchCancel = UIControlEvents(rawValue: 1 << 8)
    
    public static var ValueChanged = UIControlEvents(rawValue: 1 << 12)
    public static var PrimaryActionTriggered = UIControlEvents(rawValue: 1 << 13)
    
    public static var EditingDidBegin = UIControlEvents(rawValue: 1 << 16)
    public static var EditingChanged = UIControlEvents(rawValue: 1 << 17)
    public static var EditingDidEnd = UIControlEvents(rawValue: 1 << 18)
    public static var EditingDidEndOnExit = UIControlEvents(rawValue: 1 << 19)
    
    public static var AllTouchEvents = UIControlEvents(rawValue: 0x00000FFF)
    public static var AllEditingEvents = UIControlEvents(rawValue: 0x000F0000)
    public static var ApplicationReserved = UIControlEvents(rawValue: 0x0F000000)
    public static var SystemReserved = UIControlEvents(rawValue: 0xF0000000)
    public static var AllEvents = UIControlEvents(rawValue: 0xFFFFFFFF)
}
    
// =======================================================

public struct UIControlState : OptionSetType {
    public var rawValue: UInt
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    public static var Normal = UIControlState(rawValue: 0)
    public static var Highlighted = UIControlState(rawValue: 1 << 0)
    public static var Disabled = UIControlState(rawValue: 1 << 1)
    public static var Selected = UIControlState(rawValue: 1 << 2)
    public static var Focused = UIControlState(rawValue: 1 << 3)
    public static var Application = UIControlState(rawValue: 0x00FF0000)
    public static var Reserved = UIControlState(rawValue: 0xFF000000)
}
    
// =======================================================

public enum UIControlContentVerticalAlignment : Int {
    case Center
    case Top
    case Bottom
    case Fill
}

// =======================================================

public enum UIControlContentHorizontalAlignment : Int {
    case Center
    case Left
    case Right
    case Fill
}

#endif
