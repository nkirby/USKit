// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

extension UIView {
// =======================================================
// MARK: - Animation
    
    public class func animateWithDuration(duration: NSTimeInterval, delay: NSTimeInterval, options: UIViewAnimationOptions, animations: () -> Void,
        completion: ((Bool) -> Void)?) {
        USUnimplemented()
    }
    
    public class func animateWithDuration(duration: NSTimeInterval, animations: () -> Void, completion: ((Bool) -> Void)?) {
        USUnimplemented()
    }
    
    public class func animateWithDuration(duration: NSTimeInterval, animations: () -> Void) {
        USUnimplemented()
    }
    
    public class func transitionWithView(view: UIView, duration: NSTimeInterval, options: UIViewAnimationOptions, animations: (() -> Void)?,
        completion: ((Bool) -> Void)?) {
        USUnimplemented()
    }
    
    public class func transitionFromView(fromView: UIView, toView: UIView, duration: NSTimeInterval, options: UIViewAnimationOptions, completion: ((Bool) -> Void)?) {
        USUnimplemented()
    }
    
    public class func animateKeyframesWithDuration(duration: NSTimeInterval, delay: NSTimeInterval, options: UIViewKeyframeAnimationOptions, animations: () -> Void, completion: ((Bool) -> Void)?) {
        USUnimplemented()
    }
    
    public class func addKeyframeWithRelativeStartTime(frameStartTime: Double, frameDuration: Double, animations: () -> Void) {
        USUnimplemented()
    }
    
    public class func performSystemAnimation(animation: UISystemAnimation, views: [UIView], options: UIViewAnimationOptions, animations parallelAnimations: (() -> Void)?, completion: ((Bool) -> Void)?) {
        USUnimplemented()
    }
    
    public class func performWithoutAnimation(actionsWithoutAnimation: () -> Void) {
        USUnimplemented()
    }

// =======================================================
// MARK: - Animating Views
    
    public class func beginAnimations(animationID: String?, context: UnsafeMutablePointer<Void>) {
        USUnimplemented()
    }
    
    public class func commitAnimations() {
        USUnimplemented()
    }
    
    public class func setAnimationStartDate(startDate: NSDate) {
        USUnimplemented()
    }
    
    public class func setAnimationsEnabled(enabled: Bool) {
        USUnimplemented()
    }
    
    public class func setAnimationDelegate(delegate: AnyObject?) {
        USUnimplemented()
    }
    
    public class func setAnimationWillStartSelector(selector: Selector) {
        USUnimplemented()
    }
    
    public class func setAnimationDidStopSelector(selector: Selector) {
        USUnimplemented()
    }
    
    public class func setAnimationDuration(duration: NSTimeInterval) {
        USUnimplemented()
    }
    
    public class func setAnimationDelay(delay: NSTimeInterval) {
        USUnimplemented()
    }
    
    public class func setAnimationCurve(curve: UIViewAnimationCurve) {
        USUnimplemented()
    }
    
    public class func setAnimationRepeatCount(repeatCount: Float) {
        USUnimplemented()
    }
    
    public class func setAnimationRepeatAutoreverses(repeatAutoreverses: Bool) {
        USUnimplemented()
    }
    
    public class func setAnimationBeginsFromCurrentState(fromCurrentState: Bool) {
        USUnimplemented()
    }
    
    public class func setAnimationTransition(transition: UIViewAnimationTransition, forView view: UIView, cache: Bool) {
        USUnimplemented()
    }
    
    public class func areAnimationsEnabled() -> Bool {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Motion Effects
    
    public func addMotionEffect(effect: UIMotionEffect) {
        USUnimplemented()
    }
    
    public var motionEffects: [UIMotionEffect] {
        USUnimplemented()
    }
    
    public func removeMotionEffect(effect: UIMotionEffect) {
        USUnimplemented()
    }
}

#endif