// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

import Cocoa
import USKit

// =======================================================

class USKRootViewController: UIViewController {
    override func viewDidLoad() {
        USLog("USKR: viewDidLoad")
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func viewWillLayoutSubviews() {
        USLog("USKR: viewWillLayoutSubviews")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        USLog("USKR: viewDidLayoutSubviews")
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        USLog("USKR: viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        USLog("USKR: viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        USLog("USKR: viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        USLog("USKR: viewDidDisappear")
    }
}
