// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public struct UIRectEdge : OptionSetType {
    public let rawValue: UInt
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    static let None = UIRectEdge(rawValue: 1)
    static var Top = UIRectEdge(rawValue: 2)
    static var Left = UIRectEdge(rawValue: 4)
    static var Bottom = UIRectEdge(rawValue: 8)
    static var Right = UIRectEdge(rawValue: 16)
    static var All = UIRectEdge(rawValue: 32)
}

// =======================================================
// MARK: - Constants
    
public let UIRectEdgeNone = UIRectEdge.None
public let UIRectEdgeTop = UIRectEdge.Top
public let UIRectEdgeLeft = UIRectEdge.Left
public let UIRectEdgeBottom = UIRectEdge.Bottom
public let UIRectEdgeRight = UIRectEdge.Right
public let UIRectEdgeAll = UIRectEdge.All

#endif