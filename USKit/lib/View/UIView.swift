// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
  
    public typealias UIColor = NSColor
    
public class UIView: NSResponder {
    private var _subviews = [UIView]()
    private(set) public var backingView: NSView!
    public var shouldSendTouchEventsAsMouseEvents = true
    
    public var backgroundColor: UIColor? {
        didSet {
            self.backingView.layer?.backgroundColor = self.backgroundColor?.CGColor
        }
    }
    
// =======================================================
// MARK: - Init, etc...
    
    public override convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    public init(frame: CGRect) {
        super.init()
        
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
// MARK: - Responding
    
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
    
    public var autoresizingMask: NSAutoresizingMaskOptions {
        get { return self.backingView.autoresizingMask }
        set { self.backingView.autoresizingMask = newValue }
    }
    
    
// =======================================================
// MARK: - Subviews
    
    public func addSubview(view: UIView) {
        if !self._subviews.contains(view) {
            view.backingView.frame = view.backingView.frame.flippedWithin(self.backingView.frame)
            self._subviews.append(view)
            self.backingView.addSubview(view.backingView)
        }
    }
}

#endif
