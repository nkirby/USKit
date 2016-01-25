// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================
    
extension UIView {
    
// =======================================================
// MARK: - Layout Anchors
    
    public var bottomAnchor: NSLayoutYAxisAnchor {
        return self.backingView.bottomAnchor
    }
    
    public var centerXAnchor: NSLayoutXAxisAnchor {
        return self.backingView.centerXAnchor
    }
    
    public var centerYAnchor: NSLayoutYAxisAnchor {
        return self.backingView.centerYAnchor
    }
    
    public var firstBaselineAnchor: NSLayoutYAxisAnchor {
        return self.backingView.firstBaselineAnchor
    }
    
    public var heightAnchor: NSLayoutDimension {
        return self.backingView.heightAnchor
    }
    
    public var lastBaselineAnchor: NSLayoutYAxisAnchor {
        return self.backingView.lastBaselineAnchor
    }
    
    public var leadingAnchor: NSLayoutXAxisAnchor {
        return self.backingView.leadingAnchor
    }
    
    public var leftAnchor: NSLayoutXAxisAnchor {
        return self.backingView.leftAnchor
    }
    
    public var rightAnchor: NSLayoutXAxisAnchor {
        return self.backingView.rightAnchor
    }
    
    public var topAnchor: NSLayoutYAxisAnchor {
        return self.backingView.topAnchor
    }
    
    public var trailingAnchor: NSLayoutXAxisAnchor {
        return self.backingView.trailingAnchor
    }

    public var widthAnchor: NSLayoutDimension {
        return self.backingView.widthAnchor
    }

// =======================================================
// MARK: - Constraints
    
    public var constraints: [NSLayoutConstraint] {
        return self.backingView.constraints
    }
    
    public func addConstraint(constraint: NSLayoutConstraint) {
        self.backingView.addConstraint(constraint)
    }
    
    public func addConstraints(constraints: [NSLayoutConstraint]) {
        self.backingView.addConstraints(constraints)
    }
    
    public func removeConstraint(constraint: NSLayoutConstraint) {
        self.backingView.removeConstraint(constraint)
    }
    
    public func removeConstraints(constraints: [NSLayoutConstraint]) {
        self.backingView.removeConstraints(constraints)
    }
    
// =======================================================
// MARK: - Layout Guides
    
    public func addLayoutGuide(guide: UILayoutGuide) {
        USUnimplemented()
    }
    
    public func layoutGuides(guides: [UILayoutGuide]) {
        USUnimplemented()
    }
    
    public var layoutMarginsGuide: UILayoutGuide {
        USUnimplemented()
    }

    public var readableContentGuide: UILayoutGuide {
        USUnimplemented()
    }

    public func removeLayoutGuide(layoutGuide: UILayoutGuide) {
        USUnimplemented()
    }

// =======================================================
// MARK: - Measuring Auto Layout
    
    public func systemLayoutSizeFittingSize(targetSize: CGSize) -> CGSize {
        USUnimplemented()
    }
    
    public func systemLayoutSizeFittingSize(targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        USUnimplemented()
    }
    
    public func intrinsicContentSize() -> CGSize {
        USUnimplemented()
    }
    
    public func invalidateIntrinsicContentSize() {
        USUnimplemented()
    }
    
    public func contentCompressionResistancePriorityForAxis(axis: UILayoutConstraintAxis) -> UILayoutPriority {
        USUnimplemented()
    }
    
    public func setContentCompressionResistancePriority(priority: UILayoutPriority, forAxis axis: UILayoutConstraintAxis) {
        USUnimplemented()
    }
    
    public func contentHuggingPriorityForAxis(axis: UILayoutConstraintAxis) -> UILayoutPriority {
        USUnimplemented()
    }
    
    public func setContentHuggingPriority(priority: UILayoutPriority, forAxis axis: UILayoutConstraintAxis) {
        USUnimplemented()
    }
    
// =======================================================
// MARK: - Auto Layout Alignment
    
    public func alignmentRectForFrame(frame: CGRect) -> CGRect {
        USUnimplemented()
    }
    
    public func frameForAlignmentRect(alignmentRect: CGRect) -> CGRect {
        USUnimplemented()
    }
    
    public func alignmentRectInsets() -> UIEdgeInsets {
        USUnimplemented()
    }
    
    public func viewForBaselineLayout() -> UIView {
        USUnimplemented()
    }
    
    public var viewForFirstBaselineLayout: UIView {
        USUnimplemented()
    }
    
    public var viewForLastBaselineLayout: UIView {
        USUnimplemented()
    }

// =======================================================
// MARK: - Triggering Auto Layout
    
    public func needsUpdateConstraints() -> Bool {
        USUnimplemented()
    }
    
    public func setNeedsUpdateConstraints() {
        USUnimplemented()
    }
    
    public func updateConstraints() {
        USUnimplemented()
    }
    
    public func updateConstraintsIfNeeded() {
        USUnimplemented()
    }

// =======================================================
// MARK: - Debugging Auto Layout
    
    public func constraintsAffectingLayoutForAxis(axis: UILayoutConstraintAxis) -> [NSLayoutConstraint] {
        USUnimplemented()
    }
    
    public func hasAmbiguousLayout() -> Bool {
        USUnimplemented()
    }
    
    public func exerciseAmbiguityInLayout() {
        USUnimplemented()
    }
}
    
#endif