// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
  
public typealias UIColor = NSColor
public typealias UILayoutGuide = NSObject
public typealias UILayoutPriority = NSObject
public typealias UILayoutConstraintAxis = NSObject
public typealias UISemanticContentAttribute = NSObject
public typealias UIViewPrintFormatter = NSObject
public typealias UIViewAnimationOptions = NSObject
public typealias UIViewKeyframeAnimationOptions = NSObject
public typealias UISystemAnimation = NSObject
public typealias UIViewAnimationCurve = NSObject
public typealias UIViewAnimationTransition = NSObject
public typealias UIMotionEffect = NSObject
    
// =======================================================

internal class USInternalNSView: NSView {
    override var flipped: Bool {
        get { return true }
    }
}
    
// =======================================================

public class UIView: NSResponder {
    private(set) public var backingView: NSView!
    public var shouldSendTouchEventsAsMouseEvents = true
    
    public var tag = 0
    
// =======================================================
// MARK: - Appearance

    public var backgroundColor: UIColor? {
        didSet {
            self.backingView.layer?.backgroundColor = self.backgroundColor?.CGColor
        }
    }

    public var hidden: Bool {
        get { return self.backingView.hidden }
        set { self.backingView.hidden = newValue }
    }

    public var alpha: CGFloat {
        get { return self.backingView.alphaValue }
        set { self.backingView.alphaValue = newValue }
    }

    public var opaque: Bool {
        USUnimplemented()
    }

    public var tintColor = UIColor.whiteColor()
    public var tintAdjustmentMode = UIViewTintAdjustmentMode.Normal

    public var clipsToBounds: Bool {
        get { return self.backingView.layer?.masksToBounds ?? false }
        set { self.backingView.layer?.masksToBounds = newValue }
    }
    
    public var clearsContextBeforeDrawing = true
    public var maskView: UIView?

// =======================================================
// MARK: - Event-Related Behavior
    
    public var userInteractionEnabled: Bool = true
    public var multipleTouchEnabled: Bool = true
    public var exclusiveTouch: Bool = false

// =======================================================
// MARK: - Frames
    
    public var bounds: CGRect {
        get { return self.backingView.bounds }
        set { self.backingView.bounds = newValue }
    }
    
    public var frame: CGRect {
        get { return self.backingView.frame }
        set { self.backingView.frame = newValue }
    }
    
    public var center: CGPoint {
        get { return self.frame.centerPoint() }
        set { self.frame = self.frame.centeredOn(point: newValue) }
    }

    public var transform: CGAffineTransform = CGAffineTransformIdentity
    public var layoutMargins: UIEdgeInsets = UIEdgeInsets.zero
    public var preservesSuperviewLayoutMargins = false

// =======================================================
// MARK: - Hierarchy 
    
    internal(set) public var superview: UIView?
    internal(set) public var subviews = [UIView]()
    internal(set) public var window: UIWindow?
    internal(set) public var gestureRecognizers: [UIGestureRecognizer]? = nil

// =======================================================
// MARK: - Resizing Behavior
    
    public var autoresizingMask: UIViewAutoresizing {
        get { return UIViewAutoresizing(maskOptions: self.backingView.autoresizingMask) }
        set { self.backingView.autoresizingMask = newValue.autoresizingMask }
    }
    
    public var autoresizesSubviews: Bool {
        get { return self.backingView.autoresizesSubviews }
        set { self.backingView.autoresizesSubviews = newValue }
    }
    
    public var contentMode: UIViewContentMode = .ScaleToFill

    @available(*, unavailable)
    public var contentStretch = CGRect.zero
    
// =======================================================
// MARK: - State Restoration
    
    public var restorationIdentifier: String? = nil

// =======================================================
// MARK: - Misc
    
    public var layer: CALayer? {
        get { return self.backingView.layer }
    }

    public var translatesAutoresizingMaskIntoConstraints = false
    public var contentScaleFactor: CGFloat = 1.0
    public var semanticContentAttribute: UISemanticContentAttribute {
        USUnimplemented()
    }
    
    public var focused = false

// =======================================================
// MARK: - Init, etc...
    
    public override convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public init(frame: CGRect) {
        super.init()
        
        self.setupView(frame: frame)
        self.gestureRecognizers = []
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    deinit {
        self.backingView.removeObserver(self, forKeyPath: "nextResponder")
    }
    
    private func setupView(frame frame: CGRect) {
        let view = self.generateBackingView(frame: frame)
        view.wantsLayer = true
        view.addObserver(self, forKeyPath: "nextResponder", options: NSKeyValueObservingOptions.New, context: nil)

        self.backingView = view
    }

    public func generateBackingView(frame frame: CGRect) -> NSView {
        return USInternalNSView(frame: frame)
    }
    
// =======================================================
// MARK: - Layer
    
    public class func layerClass() -> AnyClass {
        return CALayer.self
    }

// =======================================================
// MARK: - Responder
    
    public override var acceptsFirstResponder: Bool {
        return true
    }

// =======================================================
// MARK: - KVO
    
    public override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        guard let key = keyPath else {
            return
        }
        
        switch key {
        case "nextResponder":
            if let obj = object as? NSObject where obj == self.backingView {
                if self.backingView.nextResponder != self {
                    self.nextResponder = self.backingView.nextResponder
                    self.backingView.nextResponder = self
                }
            }
            
        default:
            break
        }
    }
    
// =======================================================
// MARK: - UIResponding
    
    public override func mouseEntered(theEvent: NSEvent) {
        self.nextResponder?.mouseEntered(theEvent)
    }
    
    public override func mouseExited(theEvent: NSEvent) {
        self.nextResponder?.mouseExited(theEvent)
    }
    
    public override func mouseDown(theEvent: NSEvent) {
        self.nextResponder?.mouseDown(theEvent)
        
        let event = UIEvent(pointerEvent: theEvent)
        let touches = event.allTouches() ?? []
        self.touchesBegan(touches, withEvent: event)
    }

    public override func mouseUp(theEvent: NSEvent) {
        self.nextResponder?.mouseUp(theEvent)
        
        let event = UIEvent(pointerEvent: theEvent)
        let touches = event.allTouches() ?? []
        self.touchesEnded(touches, withEvent: event)
    }
    
    public override func mouseDragged(theEvent: NSEvent) {
        self.nextResponder?.mouseDragged(theEvent)
        
        let event = UIEvent(pointerEvent: theEvent)
        let touches = event.allTouches() ?? []
        self.touchesMoved(touches, withEvent: event)
    }
}

#endif
