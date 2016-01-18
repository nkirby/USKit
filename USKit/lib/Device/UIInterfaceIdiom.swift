// =======================================================
// USKit: A shared platform for Cocoa applications
// github.com/nkirby/USKit
// =======================================================

#if os(OSX)
import Cocoa
    
public enum UIUserInterfaceIdiom {
    case Unspecified
    case Phone
    case Pad
    case TV
}
 
public func UI_USER_INTERFACE_IDIOM() -> UIUserInterfaceIdiom {
    return .Unspecified
}
    
#endif

// =======================================================

public enum USUserInterfaceIdiom {
    case Unspecified
    case Phone
    case Pad
    case TV
    case Mac
    
    public var interfaceIdiom: UIUserInterfaceIdiom {
        switch self {
        case .Unspecified, .Mac:
            return UIUserInterfaceIdiom.Unspecified
            
        case .Phone:
            return UIUserInterfaceIdiom.Phone
            
        case .Pad:
            return UIUserInterfaceIdiom.Pad
            
        case .TV:
            return UIUserInterfaceIdiom.TV
        }
    }
}

public func US_USER_INTERFACE_IDIOM() -> USUserInterfaceIdiom {
    #if os(OSX)
    return .Mac
    #else
    USUnimplemented()
    #endif
}
