// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
    
    public typealias UIStoryboard = NSObject
    public typealias UIStoryboardSegue = NSObject
    public typealias UIStoryboardUnwindSegueSource = NSObject
    public typealias UIViewControllerTransitionCoordinator = NSObject
    public typealias UIPresentationController = NSObject
    public typealias UIPopoverPresentationController = NSObject
    public typealias UILayoutSupport = NSObject
    public typealias UIInterfaceOrientationMask = NSObject
    public typealias UISplitViewController = NSObject
    public typealias UITraitCollection = NSObject
    public typealias UINavigationController = NSObject
    public typealias UITabBarController = NSObject
    public typealias UIViewControllerPreviewing = NSObject
    public typealias UIPreviewActionItem = NSObject
    public typealias UIStatusBarStyle = NSObject
    public typealias UIStatusBarAnimation = NSObject
    public typealias UIBarButtonItem = NSObject
    public typealias UITabBarItem = NSObject
    public typealias UIKeyCommand = NSObject
    
    public enum UIModalPresentationStyle : Int {
        case FullScreen
        case PageSheet
        case FormSheet
        case CurrentContext
        case Custom
        case OverFullScreen
        case OverCurrentContext
        case Popover
        case None
    }

    public enum UIModalTransitionStyle : Int {
        case CoverVertical
        case FlipHorizontal
        case CrossDissolve
        case PartialCurl
    }

    @objc public protocol UIViewControllerTransitioningDelegate: NSObjectProtocol {
    }
    
    @objc public protocol UIViewControllerPreviewingDelegate: NSObjectProtocol {
    }
    
// =======================================================

public class UIViewController: UIResponder {
    public let nibName: String?
    public let nibBundle: NSBundle?
    
    internal(set) public var storyboard: UIStoryboard?
    
// =======================================================
// MARK: - Root View
    
    private var _view: UIView?
    
    public var view: UIView! {
        if !self.isViewLoaded() {
            self.loadView()
        }
        
        return self._view!
    }
    
    public var viewIfLoaded: UIView? {
        return self._view
    }
    
// =======================================================
// MARK: - Info
    
    public var title: String? = nil
    public var preferredContentSize: CGSize = CGSize.zero
    public var extensionContext: NSExtensionContext? = nil
    
    public var navigationItem: UINavigationItem {
        USUnimplemented()
    }
    
    public var tabBarItem: UITabBarItem {
        USUnimplemented()
    }
    
    public var hidesBottomBarWhenPushed = false
    
    public var editing = false
    
// =======================================================
// MARK: - Presenting & Transitioning
    
    public var modalPresentationStyle: UIModalPresentationStyle = .None
    public var modalTransitionStyle: UIModalTransitionStyle = .CoverVertical
    public var modalInPopover = false
    public var definesPresentationContext = false
    public var providesPresentationContextTransitionStyle = false
    
    public weak var transitioningDelegate: UIViewControllerTransitioningDelegate?
    public var presentationController: UIPresentationController? {
        return nil
    }
    
    public var popoverPresentationController: UIPopoverPresentationController? {
        return nil
    }

    internal(set) public var presentingViewController: UIViewController? = nil
    internal(set) public var presentedViewController: UIViewController? = nil
    internal(set) public weak var parentViewController: UIViewController? = nil
    internal(set) public var navigationController: UINavigationController? = nil
    internal(set) public var splitViewController: UISplitViewController? = nil
    internal(set) public var tabBarController: UITabBarController? = nil
    
    public var modalPresentationCapturesStatusBarAppearance = false
    
// =======================================================
// MARK: - Layout
    
    public var bottomLayoutGuide: UILayoutSupport {
        USUnimplemented()
    }
    
    public var topLayoutGuide: UILayoutSupport {
        USUnimplemented()
    }
    
    public var edgesForExtendedLayout: UIRectEdge = UIRectEdge.None
    public var extendedLayoutIncludesOpaqueBars = false
    public var automaticallyAdjustsScrollViewInsets = false
    
    internal(set) public var childViewControllers = [UIViewController]()
    internal(set) public var toolbarItems: [UIBarButtonItem]? = nil
    
// =======================================================
// MARK: - Init, etc...
    
    public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.nibName = nibNameOrNil
        self.nibBundle = nibBundleOrNil
        
        super.init()
    }
    
    public required init?(coder: NSCoder) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Storyboards
    
    public func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        USUnimplemented()
    }
    
    public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        USUnimplemented()
    }
    
    public func performSegueWithIdentifier(identifier: String, sender: AnyObject?) {
        USUnimplemented()
    }
    
    public func allowedChildViewControllersForUnwindingFromSource(source: UIStoryboardUnwindSegueSource) -> [UIViewController] {
        USUnimplemented()
    }
    
    public func childViewControllerContainingSegueSource(source: UIStoryboardUnwindSegueSource) -> UIViewController? {
        USUnimplemented()
    }
    
    public func canPerformUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject) -> Bool {
        USUnimplemented()
    }
    
    public func unwindForSegue(unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - View Loading / Lifecycle
    
    public func isViewLoaded() -> Bool {
        return (self._view != nil)
    }
    
    public func loadView() {
        precondition(!self.isViewLoaded(), "USKit: Do not invoke loadView() yourself.")
        
        self._view = UIView(frame: CGRect.zero)
        self.viewDidLoad()
    }
    
    public func viewDidLoad() {
    }
    
    public func loadViewIfNeeded() {
        if !self.isViewLoaded() {
            self.loadView()
        }
    }
    
    public func viewWillAppear(animated: Bool) {
    }
    
    public func viewDidAppear(animated: Bool) {
    }
    
    public func viewWillDisappear(animated: Bool) {
    }
    
    public func viewDidDisappear(animated: Bool) {
    }
    
    public func willMoveToParentViewController(parent: UIViewController?) {
    }
    
    public func didMoveToParentViewController(parent: UIViewController?) {
    }
    
    public func didReceiveMemoryWarning() {
    }
    
    public func applicationFinishedRestoringState() {
    }
    
// =======================================================
// MARK: - Presentation
    
    public func showViewController(vc: UIViewController, sender: AnyObject?) {
        USUnimplemented()
    }
    
    public func showDetailViewController(vc: UIViewController, sender: AnyObject?) {
        USUnimplemented()
    }
    
    public func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool,
        completion: (() -> Void)?) {
        USUnimplemented()
    }
    
    public func dismissViewControllerAnimated(flag: Bool, completion: (() -> Void)?) {
        USUnimplemented()
    }
    
    public func disablesAutomaticKeyboardDismissal() -> Bool {
        USUnimplemented()
    }
 
// =======================================================
// MARK: - Transitioning
    
    public func transitionCoordinator() -> UIViewControllerTransitionCoordinator? {
        USUnimplemented()
    }
    
    public func targetViewControllerForAction(action: Selector, sender: AnyObject?) -> UIViewController? {
        USUnimplemented()
    }
    
    public func isMovingFromParentViewController() -> Bool {
        USUnimplemented()
    }
    
    public func isMovingToParentViewController() -> Bool {
        USUnimplemented()
    }
    
    public func isBeingPresented() -> Bool {
        USUnimplemented()
    }
    
    public func isBeingDismissed() -> Bool {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Layout
    
    public func viewWillLayoutSubviews() {
        for vc in self.childViewControllers {
            vc.viewWillLayoutSubviews()
        }
    }
    
    public func viewDidLayoutSubviews() {
        for vc in self.childViewControllers {
            vc.viewDidLayoutSubviews()
        }
    }
    
    public func updateViewConstraints() {
        USUnimplemented()
    }
    
    public func shouldAutorotate() -> Bool {
        return true
    }
    
    public func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        USUnimplemented()
    }
    
    public func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        USUnimplemented()
    }
    
    public class func attemptRotationToDeviceOrientation() {
        USUnimplemented()
    }
    
    public func collapseSecondaryViewController(secondaryViewController: UIViewController, forSplitViewController splitViewController: UISplitViewController) {
        USUnimplemented()
    }
    
    public func separateSecondaryViewControllerForSplitViewController(splitViewController: UISplitViewController) -> UIViewController? {
        USUnimplemented()
    }
    
    public func setToolbarItems(toolbarItems: [UIBarButtonItem]?, animated: Bool) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Child View Controllers
    
    public func addChildViewController(viewController: UIViewController) {
        if let _ = viewController.parentViewController {
            viewController.removeFromParentViewController()
        }
        
        viewController.willMoveToParentViewController(self)
        self.childViewControllers.append(viewController)
        viewController.didMoveToParentViewController(self)
    }
    
    public func removeFromParentViewController() {
        self.willMoveToParentViewController(nil)
        self.parentViewController?._removeChildViewController(self)
        self.didMoveToParentViewController(nil)
    }
    
    private func _removeChildViewController(viewController: UIViewController) {
        if let idx = self.childViewControllers.indexOf(viewController) {
            self.childViewControllers.removeAtIndex(idx)
        }
    }
    
    public func transitionFromViewController(fromViewController: UIViewController, toViewController: UIViewController, duration: NSTimeInterval, options: UIViewAnimationOptions, animations: (() -> Void)?, completion: ((Bool) -> Void)?) {
        USUnimplemented()
    }

    public func shouldAutomaticallyForwardAppearanceMethods() -> Bool {
        USUnimplemented()
    }
    
    public func beginAppearanceTransition(isAppearing: Bool, animated: Bool) {
        USUnimplemented()
    }
    
    public func endAppearanceTransition() {
        USUnimplemented()
    }
    
    public func setOverrideTraitCollection(collection: UITraitCollection?, forChildViewController childViewController: UIViewController) {
        USUnimplemented()
    }
    
    public func overrideTraitCollectionForChildViewController(childViewController: UIViewController) -> UITraitCollection? {
        USUnimplemented()
    }
    
    public func childViewControllerForStatusBarHidden() -> UIViewController? {
        USUnimplemented()
    }
    
    public func childViewControllerForStatusBarStyle() -> UIViewController? {
        USUnimplemented()
    }
    
    
// =======================================================
// MARK: - Previewing
    
    public func registerForPreviewingWithDelegate(delegate: UIViewControllerPreviewingDelegate, sourceView: UIView) -> UIViewControllerPreviewing {
        USUnimplemented()
    }
    
    public func unregisterForPreviewingWithContext(previewing: UIViewControllerPreviewing) {
        USUnimplemented()
    }
    
    public func previewActionItems() -> [UIPreviewActionItem] {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Status Bar
    
    public func preferredStatusBarStyle() -> UIStatusBarStyle {
        USUnimplemented()
    }
    
    public func prefersStatusBarHidden() -> Bool {
        USUnimplemented()
    }

    public func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        USUnimplemented()
    }
    
    public func setNeedsStatusBarAppearanceUpdate() {
        USUnimplemented()
    }

// =======================================================
// MARK: - Editing
    
    public func setEditing(editing: Bool, animated: Bool) {
        USUnimplemented()
    }
    
    public func editButtonItem() -> UIBarButtonItem {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Key Commands
    
    public func addKeyCommand(keyCommand: UIKeyCommand) {
        USUnimplemented()
    }
    
    public func removeKeyCommand(keyCommand: UIKeyCommand) {
        USUnimplemented()
    }
}

#endif
