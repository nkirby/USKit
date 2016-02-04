// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

    public typealias UIToolbar = NSObject
    public typealias UITapGestureRecognizer = UIGestureRecognizer
    public typealias UIPanGestureRecognizer = UIGestureRecognizer
    
    @objc public protocol UINavigationControllerDelegate: NSObjectProtocol {
    }
    
    public let UINavigationControllerHideShowBarDuration: CGFloat = 0.5
    
// =======================================================
    
public class UINavigationController: UIViewController {
    public var viewControllers = [UIViewController]()
    
    public var topViewController: UIViewController? {
        return self.viewControllers.last
    }
    
    public var visibleViewController: UIViewController? {
        return self.presentedViewController ?? self.topViewController
    }
    
    internal(set) public var interactivePopGestureRecognizer: UIGestureRecognizer? = nil

// =======================================================
// MARK: - Views
    
    public var navigationBar: UINavigationBar!
    public var toolbar: UIToolbar!
    
// =======================================================
// MARK: - Info
    
    public var toolbarHidden = false
    public var hidesBarsOnTap = false
    public var hidesBarsOnSwipe = false
    public var hidesBarsWhenVerticallyCompact = false
    public var hidesBarsWhenKeyboardAppears: Bool {
        get { return false }
        set { }
    }
    public var navigationBarHidden = false
//    public unowned(unsafe) var barHideOnTapGestureRecognizer: UIGestureRecognizer
//    public unowned(unsafe) var barHideOnSwipeGestureRecognizer: UIPanGestureRecognizer
    
    public weak var delegate: UINavigationControllerDelegate?
    
// =======================================================
// MARK: - Init, etc...
    
    public init(rootViewController: UIViewController) {
        self.viewControllers = [rootViewController]
        super.init(nibName: nil, bundle: nil)
    }
    
    public init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?) {
        USUnimplemented()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    deinit {
        self.viewControllers.removeAll()
    }
    
// =======================================================
// MARK: - Lifecycle
    
    public override func loadView() {
        super.loadView()
        
        self.navigationBar = UINavigationBar()
    }
    
// =======================================================
// MARK: - View Controller Stack
    
    public func setViewControllers(viewControllers: [UIViewController]?, animated: Bool) {
        USUnimplemented()
    }
    
    public func pushViewController(viewController: UIViewController, animated: Bool) {
        USUnimplemented()
    }
    
    public func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        USUnimplemented()
    }
    
    public func popToRootViewControllerAnimated(animated: Bool) -> [UIViewController]? {
        USUnimplemented()
    }
    
    public func popToViewController(viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        USUnimplemented()
    }
    
    public override func showViewController(vc: UIViewController, sender: AnyObject?) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Bars
    
    public func setNavigationBarHidden(hidden: Bool, animated: Bool) {
        USUnimplemented()
    }

    public func setToolbarHidden(hidden: Bool, animated: Bool) {
        USUnimplemented()
    }
    
}

#endif
