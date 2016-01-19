// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================
// MARK: - Stubs
    
public typealias UICoordinateSpace = NSObject
public typealias UIScreenMode = NSObject
public typealias CADisplayLink = NSObject
    
// =======================================================
// MARK: -
    
// TODO: Screen Modes
// TODO: Notifications
// TODO: Stub Out UICoordinateSpace
    
public typealias UIScreen = NSScreen
    
extension UIScreen {

// =======================================================
// MARK: - Mirroring

    public var mirrored: Bool {
        return false
    }
    
// =======================================================
// MARK: - Coordinate Spaces

    public var coordinateSpace: UICoordinateSpace {
        USUnimplemented()
    }
    
    public var fixedCoordinateSpace: UICoordinateSpace {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Bounds & Scale
    
    public var bounds: CGRect {
        get { return NSRectToCGRect(self.frame) }
    }
    
    public var nativeBounds: CGRect {
        get { return self.bounds }
    }
    
    public var nativeScale: CGFloat {
        get { return self.backingScaleFactor }
    }
    
    public var scale: CGFloat {
        get { return self.backingScaleFactor }
    }
    
// =======================================================
// MARK: - Screen Modes
    
    public var preferredMode: UIScreenMode? {
        USUnimplemented()
    }
    
    public var availableModes: [UIScreenMode] {
        USUnimplemented()
    }
    
    public var currentMode: UIScreenMode? {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Display Links
    
    public func displayLinkWithTarget(target: AnyObject, selector sel: Selector) -> CADisplayLink? {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Brightness
    
    public var brightness: CGFloat {
        USUnimplemented()
    }
    
    public var wantsSoftwareDimming: Bool {
        USUnimplemented()
    }
            
// =======================================================
// MARK: - Snapshotting
    
    public func snapshotViewAfterScreenUpdates(afterUpdates: Bool) -> NSView {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Focusing
    
    public var focusedView: NSView? {
        get { return nil }
    }
    
    public var supportsFocus: Bool {
        get { return false }
    }
}
    
#endif
