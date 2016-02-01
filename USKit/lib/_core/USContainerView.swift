// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public let USContainerViewDidChangeRootViewControllerNotification = "USContainerViewDidChangeRootViewControllerNotification"
    
// =======================================================

public class USContainerView: NSView {
    public override var flipped: Bool {
        return true
    }
    
    public override var wantsUpdateLayer: Bool {
        return true
    }

    private(set) public var rootViewController: UIViewController?
    
// =======================================================
// MARK: - Init, etc...
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.setupContainerView()
    }
    
    public required init?(coder: NSCoder) {
        USUnimplemented()
    }

// =======================================================
// MARK: - Setup
    
    private func setupContainerView() {
        self.wantsLayer = true
        self.layerContentsRedrawPolicy = .OnSetNeedsDisplay
    }
    
// =======================================================
// MARK: - Layout
    
    public override func viewWillMoveToSuperview(newSuperview: NSView?) {
        super.viewWillMoveToSuperview(newSuperview)
        self.needsDisplay = true
    }
    
    public override func layoutSublayersOfLayer(layer: CALayer) {
        self.rootViewController?.viewWillLayoutSubviews()
        self.rootViewController?.viewDidLayoutSubviews()
    }
    
// =======================================================
// MARK: - Presenting
    
    public func presentViewController(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        viewController.view.frame = self.bounds
        viewController.view.alpha = 0.0
        viewController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(viewController.view.backingView)
        
        let block = {
            viewController.view.alpha = 1.0
        }
        
        if animated {
            UIView.animateWithDuration(0.2, animations: block)
        } else {
            block()
        }
    }
    
    public func presentRootViewController(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        self.rootViewController = viewController
        
        if USApplication.sharedApplication().state == .Launched {
            self.presentViewController(viewController, animated: animated, completion: completion)
        } else {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "didUpdateApplicationState:", name: USKitApplicationStateChangedNotification, object: nil)
        }
    }
    
    @objc private func didUpdateApplicationState(sender: NSNotification) {
        precondition(NSThread.isMainThread(), "USKit must fire USKitApplicationStateChangedNotification on the main thread.")
        
        guard let rootViewController = self.rootViewController else {
            return
        }
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: USKitApplicationStateChangedNotification, object: nil)
        self.presentViewController(rootViewController, animated: true, completion: nil)
        NSNotificationCenter.defaultCenter().postNotificationName(USContainerViewDidChangeRootViewControllerNotification, object: self)
    }
}

#endif
