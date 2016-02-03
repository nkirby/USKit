// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public enum UIUserInterfaceSizeClass : Int {
    case Unspecified
    case Compact
    case Regular
}

public enum UIForceTouchCapability : Int {
    case Unknown
    case Unavailable
    case Available
}

public class UITraitCollection: NSObject {
    internal(set) public var displayScale: CGFloat = 0.0
    internal(set) public var horizontalSizeClass: UIUserInterfaceSizeClass = .Unspecified
    internal(set) public var userInterfaceIdiom: UIUserInterfaceIdiom = UI_USER_INTERFACE_IDIOM()
    internal(set) public var verticalSizeClass: UIUserInterfaceSizeClass = .Unspecified
    internal(set) public var forceTouchCapability: UIForceTouchCapability = .Unknown
    
// =======================================================
// MARK: - Init, etc...

    public init(traitsFromCollections traitCollections: [UITraitCollection]) {
        USUnimplemented()
    }

    public init(displayScale: CGFloat) {
        self.displayScale = displayScale
        super.init()
    }
    
    public init(userInterfaceIdiom: UIUserInterfaceIdiom) {
        self.userInterfaceIdiom = userInterfaceIdiom
        super.init()
    }
    
    public init(horizontalSizeClass: UIUserInterfaceSizeClass) {
        self.horizontalSizeClass = horizontalSizeClass
        super.init()
    }
    
    public init(verticalSizeClass: UIUserInterfaceSizeClass) {
        self.verticalSizeClass = verticalSizeClass
        super.init()
    }
    
    public init(forceTouchCapability: UIForceTouchCapability) {
        self.forceTouchCapability = forceTouchCapability
        super.init()
    }
    
// =======================================================

    public func containsTraitsInCollection(collection: UITraitCollection?) -> Bool {
        USUnimplemented()
    }
}

#endif
