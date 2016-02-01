// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

import Cocoa
import USKit

// =======================================================

class USKRootViewController: UIViewController {
    override func viewDidLoad() {
        USLog("USKRootViewController viewDidLoad")
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func viewWillLayoutSubviews() {
        USLog("USKR: will layout")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        USLog("USKR: did layout")
        super.viewDidLayoutSubviews()
    }
}
