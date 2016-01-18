// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)

import Cocoa

// =======================================================
// MARK: - Image -> NSData
    
public func UIImageJPEGRepresentation(image: UIImage, _ compressionQuality: CGFloat) -> NSData? {
    USUnimplemented()
}

public func UIImagePNGRepresentation(image: UIImage) -> NSData? {
    USUnimplemented()
}

// =======================================================
// MARK: - Saving / Sharing
    
public func UIImageWriteToSavedPhotosAlbum(image: UIImage, _ completionTarget: AnyObject?, _ completionSelector: Selector, _ contextInfo: UnsafeMutablePointer<Void>) {
    NSLog("USKit unable to save image to saved photos album")
}

public func UISaveVideoAtPathToSavedPhotosAlbum(videoPath: String, _ completionTarget: AnyObject?, _ completionSelector: Selector, _ contextInfo: UnsafeMutablePointer<Void>) {
    NSLog("USKit unable to save image to saved photos album")
}

public func UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoPath: String) -> Bool {
    NSLog("USKit unable to access saved photos album")
    return false
}

#endif