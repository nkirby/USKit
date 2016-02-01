// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

extension UIView {
// =======================================================
// MARK: - Animation
    
    public class func animateWithDuration(duration: NSTimeInterval, delay: NSTimeInterval, options: UIViewAnimationOptions, animations: (() -> Void), completion: ((Bool) -> Void)?) {
        
        let block: dispatch_block_t = {
            NSAnimationContext.runAnimationGroup({ context in
                context.duration = duration
                
                animations()
            }, completionHandler: {
                completion?(true)
            })
        }

        if delay > 0 {
            USDispatch.main(delay, block: block)
        } else {
            block()
        }
    }
    
    public class func animateWithDuration(duration: NSTimeInterval, animations: (() -> Void), completion: ((Bool) -> Void)?) {
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = duration
            context.allowsImplicitAnimation = true
            
            animations()
        }, completionHandler: {
            completion?(true)
        })
    }
    
    public class func animateWithDuration(duration: NSTimeInterval, animations: (() -> Void)) {
        self.animateWithDuration(duration, animations: animations, completion: nil)
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
        actionsWithoutAnimation()
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

// =======================================================
// MARK: - 
    
    public class func setAnimationsEnabled(enabled: Bool) {
        USAnimator.sharedAnimator().animationsEnabled = enabled
    }

    public class func areAnimationsEnabled() -> Bool {
        return USAnimator.sharedAnimator().animationsEnabled
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