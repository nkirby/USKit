// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public enum UIBarStyle : Int {
    case Default
    case Black

    static var BlackOpaque: UIBarStyle {
        return UIBarStyle.Black
    }
    case BlackTranslucent
}

@objc public protocol UINavigationBarDelegate: NSObjectProtocol {
    optional func navigationBar(navigationBar: UINavigationBar, shouldPushItem item: UINavigationItem) -> Bool
    optional func navigationBar(navigationBar: UINavigationBar, didPushItem item: UINavigationItem)
    
    optional func navigationBar(navigationBar: UINavigationBar, shouldPopItem item: UINavigationItem) -> Bool
    optional func navigationBar(navigationBar: UINavigationBar, didPopItem item: UINavigationItem)
}
    
// =======================================================

public class UINavigationBar: UIView {
    public weak var delegate: UINavigationBarDelegate?
    public var items = [UINavigationItem]()
    
    public var topItem: UINavigationItem? {
        return self.items.last
    }
    
    public var backItem: UINavigationItem? {
        return self.items.get(self.items.count - 2)
    }
    
    public var backIndicatorImage: UIImage?
    public var backIndicatorTransitionMaskImage: UIImage?
    public var barStyle: UIBarStyle = .Default
    public var barTintColor: UIColor?
    public var shadowImage: UIImage?
    public var translucent = true
    public var titleTextAttributes: [String : AnyObject]?
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.backgroundColor = UIColor.blackColor()
    }
    
// =======================================================
// MARK: - Stack
    
    public func pushNavigationItem(item: UINavigationItem, animated: Bool) {
        USUnimplemented()
    }
    
    public func popNavigationItemAnimated(animated: Bool) -> UINavigationItem? {
        USUnimplemented()
    }
    
    public func setItems(items: [UINavigationItem]?, animated: Bool) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Style
    
    public func backgroundImageForBarMetrics(barMetrics: UIBarMetrics) -> UIImage? {
        USUnimplemented()
    }
    
    public func setBackgroundImage(backgroundImage: UIImage?, forBarMetrics barMetrics: UIBarMetrics) {
        USUnimplemented()
    }

    public func backgroundImageForBarPosition(barPosition: UIBarPosition, barMetrics: UIBarMetrics) -> UIImage? {
        USUnimplemented()
    }
    
    public func setBackgroundImage(backgroundImage: UIImage?, forBarPosition barPosition: UIBarPosition, barMetrics: UIBarMetrics) {
        USUnimplemented()
    }
    
    public func titleVerticalPositionAdjustmentForBarMetrics(barMetrics: UIBarMetrics) -> CGFloat {
        USUnimplemented()
    }
    
    public func setTitleVerticalPositionAdjustment(adjustment: CGFloat, forBarMetrics barMetrics: UIBarMetrics) {
        USUnimplemented()
    }
}

#endif
