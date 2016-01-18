// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa

// =======================================================

public extension NSIndexPath {
    convenience init(row: Int, inSection section: Int) {
        self.init(indexes: [row, section], length: 2)
    }
    
    public var row: Int {
        get { return self.indexAtPosition(1) }
    }
}
        
#endif