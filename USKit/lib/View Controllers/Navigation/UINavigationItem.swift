// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public class UINavigationItem: NSObject {
    public var title: String?
    public var prompt: String?
    
    public var backBarButtonItem: UIBarButtonItem?
    public var hidesBackButton = false
    public var leftItemsSupplementBackButton = false
    
// =======================================================
// MARK: - Views
    
    public var titleView: UIView?
    public var leftBarButtonItems: [UIBarButtonItem]? = nil
    public var leftBarButtonItem: UIBarButtonItem? = nil
    public var rightBarButtonItems: [UIBarButtonItem]? = nil
    public var rightBarButtonItem: UIBarButtonItem? = nil
    
// =======================================================
// MARK: - Init, etc...
    
    public override init() {
        self.title = nil
        super.init()
    }
    
    public init(title: String) {
        self.title = title
        super.init()
    }
    
// =======================================================
// MARK: - Animating Changes
    
    public func setHidesBackButton(hides: Bool, animated: Bool) {
        self.hidesBackButton = hides
    }
    
    public func setLeftBarButtonItems(items: [UIBarButtonItem]?, animated: Bool) {
        self.leftBarButtonItems = items
    }
    
    public func setLeftBarButtonItem(item: UIBarButtonItem?, animated: Bool) {
        self.leftBarButtonItem = item
    }
    
    public func setRightBarButtonItems(items: [UIBarButtonItem]?, animated: Bool) {
        self.rightBarButtonItems = items
    }
    
    public func setRightBarButtonItem(item: UIBarButtonItem?, animated: Bool) {
        self.rightBarButtonItem = item
    }
}

#endif
