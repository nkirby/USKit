// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
  
public typealias UIColor = NSColor
    
public class UIView: NSResponder {
    private(set) public var backingView: NSView!
    public var shouldSendTouchEventsAsMouseEvents = true
    
// =======================================================
// MARK: - Layout
    
    public var bounds: CGRect {
        get { return self.backingView.bounds }
    }
    
    public var frame = CGRect.zero {
        didSet {
            guard let parentView = self.backingView?.superview else {
                return
            }
            
            self.backingView.frame = self.frame.flippedWithin(parentView.bounds)
        }
    }

    public var center: CGPoint {
        get { return self.frame.centerPoint() }
        set { self.frame = self.frame.centeredOn(point: newValue) }
    }
    
    public var autoresizingMask: UIViewAutoresizing {
        get { return UIViewAutoresizing(maskOptions: self.backingView.autoresizingMask) }
        set { self.backingView.autoresizingMask = newValue.autoresizingMask }
    }
    
    public var autoresizesSubviews: Bool {
        get { return self.backingView.autoresizesSubviews }
        set { self.backingView.autoresizesSubviews = newValue }
    }
    
    public var contentMode: UIViewContentMode = .ScaleToFill
    
// =======================================================
// MARK: - Style
    
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
    
    public var backgroundColor: UIColor? {
        didSet {
            self.backingView.layer?.backgroundColor = self.backgroundColor?.CGColor
        }
    }

    public var clipsToBounds: Bool {
        get { return self.backingView.layer?.masksToBounds ?? false }
        set { self.backingView.layer?.masksToBounds = newValue }
    }
    
    public var clearsContextBeforeDrawing: Bool = true
    public var maskView: UIView?

// =======================================================
// MARK: - Event-Related Behavior
    
    public var userInteractionEnabled: Bool = true
    public var multipleTouchEnabled: Bool = true
    public var exclusiveTouch: Bool = false
    
// =======================================================
// MARK: - Ownership
    
    internal(set) public var window: UIWindow?
    internal(set) public var superview: UIView?
    internal(set) public var subviews = [UIView]()
    
    public class func layerClass() -> AnyClass {
        return CALayer.self
    }
    
    public var layer: CALayer? {
        get { return self.backingView.layer }
    }

// =======================================================
// MARK: - Init, etc...
    
    public override convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public init(frame: CGRect) {
        super.init()
        
        self.frame = frame
        self.setupView()
        self.backingView.frame = frame
        
        self.backingView.addObserver(self, forKeyPath: "nextResponder", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override var acceptsFirstResponder: Bool {
        return true
    }
    
    private func setupView() {
        let view = NSView(frame: CGRect.zero)
        view.wantsLayer = true
        self.backingView = view
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
