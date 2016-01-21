// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

public class USContainerView: NSView {
    public override var flipped: Bool {
        get { return true }
        set { }
    }
    public override var canDrawSubviewsIntoLayer: Bool {
        get { return true }
        set { }
    }
    public override var wantsUpdateLayer: Bool {
        return true
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.setupContainerView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupContainerView()
    }

    private func setupContainerView() {
        self.wantsLayer = true
        self.layerContentsRedrawPolicy = .OnSetNeedsDisplay
    }
    
    public override func viewWillMoveToSuperview(newSuperview: NSView?) {
        super.viewWillMoveToSuperview(newSuperview)
        self.needsDisplay = true
    }
    
    public override func updateLayer() {
        self.layer?.backgroundColor = NSColor.redColor().CGColor
    }    
}
    
#endif
